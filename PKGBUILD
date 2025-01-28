# Maintainer: Swarnava Ghosh <swarnavaghosh04@gmail.com>
pkgname=gr-gpredict-doppler
pkgver=r32.6af9785
pkgrel=1
pkgdesc="Relay information from GPredict to GNURadio"
arch=('x86_64')
url="https://github.com/ghostop14/gr-gpredict-doppler"
license=('Apache-2.0')
depends=('gnuradio')
makedepends=('cmake')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr # for ubuntu, don't include `-DCMAKE_INSTALL_PREFIX=/usr`
    make
}

package() {
    cd "${pkgname}/build"
    make install DESTDIR="$pkgdir"
}
