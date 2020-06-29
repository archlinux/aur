# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=hipipe
pkgver=0.7.1
pkgrel=0
pkgdesc='Super fast C++17 data transformation pipeline (with Python interface).'
arch=('any')
url='https://github.com/iterait/hipipe'
license=('custom')
depends=('boost' 'opencv' 'python' 'python-numpy' 'range-v3')
makedepends=('cmake' 'gcc')
source=("https://github.com/iterait/hipipe/archive/v${pkgver}.tar.gz")
sha512sums=('26a677cc40b7d8b97c4e4c7c2560409f88457ea099e85667cc7fd6b5e01999870ca6b28aff4b530d2b2d4835de5b18105bec20b7480101ff6625c47d4f89ce2c')

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
