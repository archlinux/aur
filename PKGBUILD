# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=hipipe
pkgver=0.7.0
pkgrel=0
pkgdesc='Super fast C++17 data transformation pipeline (with Python interface).'
arch=('any')
url='https://github.com/iterait/hipipe'
license=('custom')
depends=('boost' 'opencv' 'python' 'python-numpy' 'range-v3')
makedepends=('cmake' 'gcc')
source=("https://github.com/iterait/hipipe/archive/v${pkgver}.tar.gz")
sha512sums=('cb6629502b47a7c3bb9a68b7b81d7924023324e86b131aa2832681467c3fd6215ddba91bc7f891865ee6632a51f58bcd6551d1f3880ea6538aec33fbceedf452')

prepare() {
    cd "${srcdir}/hipipe-${pkgver}"
    rm -rf build && mkdir build
}

build() {
    cd "${srcdir}/hipipe-${pkgver}"

    cd build
    cmake .. \
        -DHIPIPE_BUILTIN_RANGEV3=OFF \
        -DHIPIPE_BUILD_TEST=OFF \
        -DCMAKE_BUILD_TYPE=Release
    make -j8
}

package() {
    cd "${srcdir}/hipipe-${pkgver}"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}
