# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.4.1
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv6h armv7h)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
#checkdepends=(libpng)
conflicts=(libspng-git)
source=("https://gitlab.com/randy408/libspng/-/archive/v${pkgver}/libspng-v${pkgver}.tar.gz")
sha256sums=('4d27f8e201c0c940e81e6eb3b7a563ced3555e9902cd598bcd7dea8463c8ea24')

build() {
    arch-meson build "libspng-v${pkgver}"
    ninja -C build
}

#check() {
#    cd build
#    meson configure -Ddev_build=true
#    ninja test
#}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
    install -D "libspng-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
