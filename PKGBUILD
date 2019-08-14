# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=calls-git
pkgver=0.0.1.r47.g8f38e50
pkgrel=1
pkgdesc="Phone dialer and call handler"
arch=(i686 x86_64 armv6h armv7h)
url="https://source.puri.sm/Librem5/calls"
license=(GPL3)
depends=(evolution-data-server
         gom
         gsound
         libhandy
         libpeas
         modemmanager)
makedepends=(gobject-introspection)
provides=(calls)
conflicts=(calls)
source=("git+https://source.puri.sm/Librem5/calls.git")
md5sums=(SKIP)

pkgver() {
    cd calls
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    rm -rf build
    arch-meson calls build
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
