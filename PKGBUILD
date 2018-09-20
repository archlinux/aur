# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.3.1
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv6h armv7h)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
checkdepends=(libpng)
conflicts=(libspng-git)
source=("https://gitlab.com/randy408/libspng/-/archive/v${pkgver}/libspng-v${pkgver}.tar.gz")
md5sums=('8b4ca63f52cfc5034754341d1544b2dd')

build() {
    cd libspng-v${pkgver}
    rm -rf build
    arch-meson build
    ninja -C build
}

check() {
    cd libspng-v${pkgver}
    meson configure -Ddev_build=true build
    ninja test -C build
}

package() {
    cd libspng-v${pkgver}
    DESTDIR="${pkgdir}/" ninja -C build install
    
    install -D LICENSE "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
