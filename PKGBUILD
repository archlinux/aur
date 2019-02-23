# Maintainer: alienzj <alienchuj@gmail.com>

pkgname=range-v3-v1-beta
pkgver=0.4.0.r334.g039b2e59
pkgrel=1
pkgdesc="Experimental range library for C++11/14/17"
arch=('any')
url='https://github.com/ericniebler/range-v3/tree/v1.0-beta'
license=('Boost')
makedepends=('git' 'cmake')
source=("git+https://github.com/ericniebler/range-v3.git")
conflicts=('range-v3-git' 'range-v3')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/range-v3"
    git checkout v1.0-beta >/dev/null 2>&1
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/range-v3"
    rm -rf build && mkdir build
}

build() {
    cd "${srcdir}/range-v3"

    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRANGE_V3_TESTS=OFF \
        -DRANGE_V3_HEADER_CHECKS=OFF \
        -DRANGE_V3_EXAMPLES=OFF \
        -DRANGE_V3_PERF=OFF
    make
}

package() {
    cd "${srcdir}/range-v3"
	  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 

    cd build
    make DESTDIR="${pkgdir}/" install
}
