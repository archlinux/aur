# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: sebfry <sebfry -at- gmail -dot- com>

pkgname=python-pyqtchart
pkgver=5.13.1
pkgrel=1
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5' 'qt5-charts' 'sip')
license=('GPL3')
arch=('i686' 'x86_64')
source=(
    "https://www.riverbankcomputing.com/static/Downloads/PyQtChart/$pkgver/PyQtChart-$pkgver.tar.gz"
)
sha256sums=('49960a1483527857b38c1527f9b6328d30bdcc84521f579c0a561a892f54130e')


build() {
  cd "$srcdir/PyQtChart-$pkgver"

  local _pyver=$(python -c 'import sys; print("%i.%i" % sys.version_info[:2])')
  local _moddir="/usr/lib/python${_pyver}/site-packages/PyQt5"

  python configure.py \
    --destdir="${_moddir}" \
    --stubsdir="${_moddir}" \
    --qtchart-sipdir=/usr/share/sip/PyQt5 \
    --apidir=/usr/share/qt/qsci
  make
}

package() {
  cd "$srcdir/PyQtChart-$pkgver"

  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
