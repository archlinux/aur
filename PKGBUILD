# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python-qscintilla-qt5
pkgver=2.14.1
pkgrel=1
pkgdesc='Python bindings for QScintilla2 (Qt5)'
arch=(x86_64)
url='https://www.riverbankcomputing.com/software/qscintilla/intro'
license=(GPL-3.0-only)
depends=(qscintilla-qt5 python-pyqt5 python qt5-base glibc libstdc++)
makedepends=(sip pyqt-builder)
source=(https://www.riverbankcomputing.com/static/Downloads/QScintilla/$pkgver/QScintilla_src-$pkgver.tar.gz)
sha256sums=('dfe13c6acc9d85dfcba76ccc8061e71a223957a6c02f3c343b30a9d43a4cdd4d')

build() {
  cd QScintilla_src-$pkgver/Python
  cp pyproject{-qt5,}.toml
  sip-build \
    --no-make \
    --qmake=/usr/bin/qmake-qt5
  cd build
  make
}

package() {
  cd QScintilla_src-$pkgver/Python/build
  make INSTALL_ROOT="$pkgdir" install
}
