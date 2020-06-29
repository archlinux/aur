# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=hipipe
pkgver=0.7.2
pkgrel=0
pkgdesc='Super fast C++17 data transformation pipeline (with Python interface).'
arch=('any')
url='https://github.com/iterait/hipipe'
license=('custom')
depends=('boost' 'opencv' 'python' 'python-numpy' 'range-v3')
makedepends=('cmake' 'gcc')
source=("https://github.com/iterait/hipipe/archive/v${pkgver}.tar.gz")
sha512sums=('f6dac2301a9a29e17440eaaf6a570a699063df8c1364a779a2abba112e10d756cc0c80ec1c6176baf9dc73c973327ec8c6df57c47d3d86d1e47d3402283e9dfc')

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
