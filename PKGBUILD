# Maintainer: Filip Matzner <filip.matzner@iterait.com>

pkgname=hipipe
pkgver=0.6.0
pkgrel=0
pkgdesc='Super fast C++17 data transformation pipeline (with Python interface).'
arch=('any')
url='https://github.com/iterait/hipipe'
license=('custom')
depends=('boost' 'opencv' 'python' 'python-numpy' 'range-v3')
makedepends=('cmake')
source=("https://github.com/iterait/hipipe/archive/v${pkgver}.tar.gz")
sha512sums=('97758f39e0973d6c8c402d6980c253059652e0e2bd4b509852f8f7d2ca7ec8cbf80c07b0ae9ba759ffbba160bbe206fd05a494b8354bda1718132dcac6aecf66')

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
