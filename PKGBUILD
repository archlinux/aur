# Maintainer: Sergey Salnikov <salsergey at gmail dot com>

_name=qcustomplot
pkgname=qcustomplot-qt6
pkgver=2.1.1
pkgrel=5
pkgdesc="Qt C++ widget for plotting and data visualization (built with Qt6)"
arch=('x86_64')
url="https://www.qcustomplot.com/"
license=('GPL-3.0-only')
depends=('qt6-base')
optdepends=('qcustomplot: header file')
makedepends=('cmake' 'graphviz' 'qt6-base')
source=(
  "${pkgname}-${pkgver}-source.tar.gz::https://www.qcustomplot.com/release/${pkgver}/QCustomPlot-source.tar.gz"
  "CMakeLists.txt"
  "QCustomPlotQt6Config.cmake.in"
)
sha512sums=('1feb4f45ef90d7709edb26c9964f0ec85ef4aa30f0a7e9fcd803fae586875e8d6744dbcfe08b21f461816ca426c8a6612f8e9c7ef9d3f5a7150c3de8fa5ee57d'
            '15fd0ebc511733eed1227d13b5e48c14fdf418b7b638fc61daa73b30b5851892cda713a60e00ecf3754d521fa0712592fd7b2a82af749c5fb769c47df636ba72'
            '8e538dbf48f9d41ac16e97f80a3b967306ef5c675d313568809bc68d402a99dad2701ceed1bb15cee0a76f526fbf8e0d987a7e4631a2ee11dc2dca941e895ea8')

prepare() {
  mv -v "${_name}-source" "${_name}-${pkgver}"
  mv -v CMakeLists.txt QCustomPlotQt6Config.cmake.in "${_name}-${pkgver}"
}

build() {
  cmake -B build -S "${_name}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cmake --install build --prefix="${pkgdir}"
}
