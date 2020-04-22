# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=xautoclick
pkgver=0.33
pkgrel=1
pkgdesc="Automates repetitive mouse clicking to reduce RSI."
arch=('i686' 'x86_64')
url="https://github.com/qarkai/xautoclick"
license=('GPL2')
depends=('gtk3')
makedepends=('cmake')
optdepends=('qt5-core: (compile time) for qt5 based gui'
            'fltk: (compile time) for fltk based gui')
source=(https://github.com/qarkai/xautoclick/archive/v${pkgver}.tar.gz)
sha256sums=('ce0fcd72758fa9b40a867b2e46914512c42f986b37d596c56ba86516bab3ea02')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    [ -d build ] && rm -rf build
    mkdir -p build && cd build
    cmake ../ \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make DESTDIR=${pkgdir} install
}
