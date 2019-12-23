# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=virtboard
pkgver=0.0.6
pkgrel=2
pkgdesc="Basic keyboard, blazing the path of modern Wayland keyboards"
url="https://source.puri.sm/Librem5/virtboard"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=(cairo
         libxkbcommon
         wayland)
makedepends=(git
             pkg-config
             meson
             wayland-protocols)
source=("https://source.puri.sm/Librem5/virtboard/-/archive/v${pkgver}/virtboard-v${pkgver}.tar.gz")
sha256sums=('0844d00b0cda6080d6a2c5b8e047ddf087c5f5f267a628d154033c7844b41181')

build() {
    rm -rf build
    arch-meson "virtboard-v${pkgver}" build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
