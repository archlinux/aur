# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.1.8
pkgrel=1
pkgdesc="Wlroots based Phone compositor"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=(gnome-desktop
         wlroots)
makedepends=(ctags
             libhandy
             meson
             vala)
source=("https://source.puri.sm/Librem5/phoc/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('56fff3a5d7ed1a3932826d3c767af835c42dc044245a6b9dc20890343d7fd090')

build() {
    rm -rf build
    arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled -Dtests=false
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
