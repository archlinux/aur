# Maintainer: Advaith Madhukar <advaith.madhukar at gmail dot com>

pkgname=pyside6-tools
_qtver=6.0.0
pkgver=${_qtver/-/}
pkgrel=3
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
pkgdesc='Tools for PySide6'
depends=(pyside6 python-pyqt6)
conflicts=(pyside2-tools)
makedepends=(cmake shiboken6)
_pkgfqn=pyside-setup-opensource-src-$_qtver
source=("https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-$pkgver-src/${_pkgfqn}.tar.xz")
sha256sums=('f47a4598118510feecc96b9d4b01063d206ac9a1240af3545163d2891db27dd4')

build() {
  cmake -B build -S ${_pkgfqn}/sources/pyside-tools/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir"/usr/bin/{rcc,designer}
  mv "$pkgdir"/usr/bin/uic "$pkgdir"/usr/bin/pyside6-uic
}
