# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=voix-bin
_pkgname=voix
pkgver=4.9.2
pkgrel=1
pkgdesc="A secure privilege escalation tool replacing sudo/doas, using PAM for authentication (pre-built)"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/Voix"
license=('OSL-3.0')
depends=('pam' 'libcap' 'libseccomp' 'yaml-cpp')
provides=('sudo' 'doas')
conflicts=('sudo' 'doas' 'voix')
backup=('etc/pam.d/voix' 'etc/voix.conf')
install="${pkgname}.install"
source=("voix-x86_64-bin.tar.gz::https://github.com/Veridian-Zenith/Voix/releases/download/v${pkgver}/voix-x86_64-bin.tar.gz")
sha256sums=('5826855b9c701254e5a8c1ae14e7b731d4ee1c8dd1221120d67d3e5a9cabc646')

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
