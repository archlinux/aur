# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=xautoclick
pkgver=0.34
pkgrel=2
pkgdesc="Automates repetitive mouse clicking to reduce RSI."
arch=('i686' 'x86_64')
url="https://github.com/qarkai/xautoclick"
license=('GPL2')
depends=('gtk3' 'libevdev')
makedepends=('cmake')
optdepends=('qt5-base: (compile time) for qt5 based gui'
            'fltk: (compile time) for fltk based gui')
source=(https://github.com/qarkai/xautoclick/archive/v${pkgver}.tar.gz)
sha256sums=('ad04c43183978cd14dfd1fd4881b0cb3e86f6f6c825e967e724396786b4b82bc')

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
