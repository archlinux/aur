# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.1.4
pkgrel=1
pkgdesc="Wlroots based Phone compositor"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=(gnome-desktop
         wlroots)
makedepends=(ctags
             libhandy
             meson
             vala)
source=("https://source.puri.sm/Librem5/phoc/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    rm -rf build
    arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
