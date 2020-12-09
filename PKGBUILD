# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=hipipe
pkgver=0.7.3
pkgrel=0
pkgdesc='Super fast C++17 data transformation pipeline (with Python interface).'
arch=('any')
url='https://github.com/iterait/hipipe'
license=('custom')
depends=('boost' 'opencv' 'python' 'python-numpy' 'range-v3')
makedepends=('cmake' 'gcc')
source=("https://github.com/iterait/hipipe/archive/v${pkgver}.tar.gz")
sha512sums=('c1ec955a0ecb87350fa5605de593e8989a06da5b9be67e188f8160b2e5cf8fde6ed27fa34d268cd1b0989020bf6e9c741e19406c61ba0b8eafcea8c5bc48a283')

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
    make -j2
}

package() {
    cd "${srcdir}/hipipe-${pkgver}"
    install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}
