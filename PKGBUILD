# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix-bin
_pkgname=voix
pkgver=4.13.1
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication (pre-built)"
arch=('x86_64' 'aarch64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas' 'voix')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install="${pkgname}.install"

# Per-architecture source arrays — AUR selects the matching one automatically
source_x86_64=("voix-x86_64-bin.tar.gz::https://github.com/Veridian-Zenith/Voix/releases/download/v${pkgver}/voix-x86_64-bin.tar.gz")
sha256sums_x86_64=('15d796d23ff0b426144d2b6b3577767e7087f8c7591fecc9491d61c75739b9e1')
sha256sums_aarch64=('e66a320603041bcadc1822d31ddbc80cf37072f602ab42c0bf3a29326d36cdb2')

source_aarch64=("voix-aarch64-bin.tar.gz::https://github.com/Veridian-Zenith/Voix/releases/download/v${pkgver}/voix-aarch64-bin.tar.gz")

package() {
    cd voix-bin
    install -Dm4755 -o root -g root voix "${pkgdir}/usr/bin/voix"
    install -Dm600 -o root -g root voix.conf "${pkgdir}/etc/voix.conf"
    install -Dm644 -o root -g root voix.pam "${pkgdir}/etc/pam.d/voix"
    install -Dm644 -o root -g root voix.1 "${pkgdir}/usr/share/man/man1/voix.1"
    mkdir -p "${pkgdir}/var/lib/voix"
    ln -sf /usr/bin/voix "${pkgdir}/usr/bin/sudo"
    ln -sf /usr/bin/voix "${pkgdir}/usr/bin/doas"
}
