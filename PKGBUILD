# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.4.2
pkgrel=1
pkgdesc="Wlroots based Phone compositor"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 armv7h aarch64)
depends=(mutter
         wlroots)
makedepends=(ctags
             libhandy
             meson
             vala)
checkdepends=(xorg-server-xvfb)
source=("https://source.puri.sm/Librem5/phoc/-/archive/v${pkgver}/phoc-v${pkgver}.tar.gz")
sha256sums=('bdb34644c7d49c953239c1e939bc5ee2bc26f6187b9d756b70b113d2734c712c')

build() {
    rm -rf build
    arch-meson phoc-v${pkgver} build -Dembed-wlroots=disabled
    ninja -C build
}

check() {
    xvfb-run ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
