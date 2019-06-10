# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: sebfry <sebfry -at- gmail -dot- com>

pkgname=python-pyqtchart
pkgver=5.12
pkgrel=1
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5' 'qt5-charts' 'sip')
license=('GPL3')
arch=('i686' 'x86_64')
source=(
    "https://www.riverbankcomputing.com/static/Downloads/PyQtChart/$pkgver/PyQtChart_gpl-$pkgver.tar.gz"
)
sha256sums=('aceac6a09f81dfb1a58bb571ac87ce5284237b1204c4030f63ab6bab273bc0d7')


build() {
  cd "$srcdir/PyQtChart_gpl-$pkgver"

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
  cd "$srcdir/PyQtChart_gpl-$pkgver"

  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
