# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.4.2
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
sha256sums=('ac1b359f645a30f9ce340f58fcf643e19b41db58d71896041fc51d77573194a5')

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
