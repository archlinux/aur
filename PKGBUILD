# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=lightly-qt
pkgver=0.3
pkgrel=1
pkgdesc="A modern style for qt applications"
url="https://github.com/Luwx/Lightly"
arch=('any')
license=('GPL')
conflicts=('lightly-git')
makedepends=(cmake extra-cmake-modules kdecoration qt5-declarative qt5-x11extras kcoreaddons kguiaddons kconfigwidgets kwindowsystem kiconthemes)
source=(
    "${pkgname}-${pkgver}::https://github.com/Luwx/Lightly/archive/v${pkgver}-alpha.tar.gz"
)
sha256sums=("9568a15f1983d82afa9480cdc8f1a64374348f2e154b48ee312a63249d5fb966")

build() {
    cd Lightly-${pkgver}-alpha
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
    make
}

package() {
    cd Lightly-${pkgver}-alpha/build
    make DESTDIR=${pkgdir} install
    install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
