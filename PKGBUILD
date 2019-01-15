# Maintainer: Christopher Arndt <aur at chrisarndt dot de>
# Contributor: sebfry <sebfry -at- gmail -dot- com>

pkgname=python-pyqtchart
pkgver=5.11.3
pkgrel=1
pkgdesc="Python bindings for the Qt Charts library"
url="https://www.riverbankcomputing.com/software/pyqtchart/"
depends=('python-pyqt5' 'qt5-charts')
license=('GPL3')
arch=('i686' 'x86_64')
source=(
    "https://sourceforge.net/projects/pyqt/files/PyQtChart/PyQtChart-$pkgver/PyQtChart_gpl-$pkgver.tar.gz"
)
sha256sums=('89abf5e48c79c4db42a01f80433bb97d64b117f801be5e4cb0b9839efc99472f')


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
