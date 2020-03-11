# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=wofi
pkgver=1.1.2
pkgrel=1
pkgdesc="Rofi-like wlroots launcher"
arch=('x86_64')
url="https://hg.sr.ht/~scoopta/wofi"
license=('GPL3')
depends=('wayland' 'gtk3')
makedepends=('meson')
conflicts=('wofi-hg')
source=("${pkgname}-v${pkgver}.tar.gz::https://hg.sr.ht/~scoopta/wofi/archive/v${pkgver}.tar.gz")
# We have to SKIP the validity check to avoid an issue with hg.sr.ht:
# https://todo.sr.ht/~sircmpwn/hg.sr.ht/33
sha256sums=('SKIP')

build() {
    cd "${pkgname}-v${pkgver}"
    meson build
    ninja -C build
}

package() {
    mkdir -p "${pkgdir}/usr/bin/" "${pkgdir}"/usr/share/man/man{1,3,5,7}
    install -D -m755 ${pkgname}-v${pkgver}/build/wofi "${pkgdir}/usr/bin/"
    install -D -m644 ${pkgname}-v${pkgver}/man/*.1 "${pkgdir}/usr/share/man/man1/"
    install -D -m644 ${pkgname}-v${pkgver}/man/*.3 "${pkgdir}/usr/share/man/man3/"
    install -D -m644 ${pkgname}-v${pkgver}/man/*.5 "${pkgdir}/usr/share/man/man5/"
    install -D -m644 ${pkgname}-v${pkgver}/man/*.7 "${pkgdir}/usr/share/man/man7/"
}
