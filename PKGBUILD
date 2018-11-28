# Maintainer: Theodoros Theodoridis <theodoridisgr@gmail.com>

pkgname=range-v3-git
pkgver=0.4.0.r34.ga50fa8c5
pkgrel=1
pkgdesc="Eric Niebler' C++ ranges library."
arch=('any')
url='https://github.com/ericniebler/range-v3'
license=('custom')
makedepends=('git' 'cmake')
source=("git+https://github.com/ericniebler/range-v3.git")
md5sums=('SKIP')

pkgver() {
  cd range-v3
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
	# install custom license
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 

    cd build
    make DESTDIR="${pkgdir}/" install
}
