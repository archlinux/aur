# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=virtboard-git
pkgver=0.0.5.r12.g49b04fb6
pkgrel=1
pkgdesc="Basic keyboard, blazing the path of modern Wayland keyboards"
url="https://source.puri.sm/Librem5/virtboard"
license=("GPL3")
arch=(i686 x86_64 armv6h armv7h)
depends=()
makedepends=(git
             pkg-config
             meson)
provides=(virtboard)
conflicts=(virtboard)
source=("git+https://source.puri.sm/Librem5/virtboard.git")
sha256sums=("SKIP")

pkgver() {
    cd virtboard
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson virtboard build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
