# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix-bin
_pkgname=voix
pkgver=4.13.2
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
sha256sums_x86_64=('fd04524b5a5546c37b7ce7557041150c1c94dda2fe9924fe59881c575483ce6b')
sha256sums_aarch64=('bc5ad5764a3103647611a21067e3f266a49a9edc5c73347cb5cd13ebabef10e2')

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
