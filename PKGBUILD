# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.6.1
pkgrel=1
pkgdesc="C library for reading and writing PNG format files with a focus on security and ease of use"
arch=(i686 x86_64 armv7 aarch64)
url="https://libspng.org/"
license=('BSD')
depends=(zlib)
makedepends=(meson)
checkdepends=(libpng)
conflicts=(libspng-git)
source=("libspng-${pkgver}::https://github.com/randy408/libspng/archive/v${pkgver}.tar.gz")
sha256sums=('336856bea0216fe0ddc6cc584be5823cfd3a142e9d90d8e1635d2d2a5241f584')

build() {
    arch-meson build "libspng-${pkgver}"
    ninja -C build
}

check() {
    cd build
    meson configure -Ddev_build=true
    ninja test
}

package() {
    DESTDIR="${pkgdir}/" ninja -C build install
    install -D "libspng-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
