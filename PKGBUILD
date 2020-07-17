# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.6.0
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv7 aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
checkdepends=(libpng)
conflicts=(libspng-git)
source=("https://gitlab.com/randy408/libspng/-/archive/v${pkgver}/libspng-v${pkgver}.tar.gz")
sha256sums=('a8ceb2d19be7cc90f226e92575dd2f6d82c634693f61a9155f5449dedc74c6e5')

build() {
    arch-meson build "libspng-v${pkgver}"
    ninja -C build
}

check() {
    cd build
    meson configure -Ddev_build=true
    ninja test
}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
    install -D "libspng-v${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
