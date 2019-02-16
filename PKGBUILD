# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.4.3
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
sha256sums=('bc0046f7798d30f8aa061b157808b4acdb734f1f81154879f3b98c49136c1516')

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
