# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix-bin
_pkgname=voix
pkgver=4.12.1
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
sha256sums_x86_64=('6e61eee807d26ee6657c75f158d752576af73cb63e545ee31755013b6331e59a')
sha256sums_aarch64=('6d22b279a35913f534988e7115122e8a2b91f5c89781a14f811c5e9d5a77392a')

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
