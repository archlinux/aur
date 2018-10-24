# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls-git
pkgver=r128.07cc15c
pkgrel=1
pkgdesc="A phone dialer and call handler."
arch=(i686 x86_64 armv6h armv7h)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(libhandy
         libmm-glib
         modemmanager)
makedepends=()
provides=(calls)
conflicts=(calls)
source=("git+https://source.puri.sm/Librem5/calls.git")
md5sums=(SKIP)

pkgver() {
    cd calls
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    rm -rf build
    arch-meson calls build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
