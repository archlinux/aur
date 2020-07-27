# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=phoc
pkgver=0.4.1
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
sha256sums=('420a4e8b1b15a99475fda1221249a7ca7c1f77c09fee114530f2a4612fde84fc')

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
