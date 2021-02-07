# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=lightly-qt
pkgver=0.4
pkgrel=1
pkgdesc="A modern style for qt applications"
url="https://github.com/Luwx/Lightly"
arch=('x86_64' 'aarch64')
license=('GPL')
conflicts=('lightly-git')
makedepends=(cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem kiconthemes)
source=(
    "${pkgname}-${pkgver}::https://github.com/Luwx/Lightly/archive/v${pkgver}.tar.gz"
)
sha256sums=('c2ba37366953de0e333cf14ee4c0827112cd7dd2d268a6356212f8d85310749a')

build() {
    cd Lightly-${pkgver}
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
    make
}

package() {
    cd Lightly-${pkgver}/build
    make DESTDIR=${pkgdir} install
    install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
