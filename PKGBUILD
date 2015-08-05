# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=mantid
pkgver=3.4.0
pkgrel=2
pkgdesc="Data analysis toolkit for neutron based instrument data"
url="http://www.mantidproject.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=(
  'libnexus'
  'qwt5'
  'qwtplot3d'
  'qscintilla'
  'boost'
  'poco'
  'muparser'
  'qtwebkit'
  'jsoncpp'
  'ipython2'
  'python2'
  'python2-numpy'
  'python2-pyqt4'
  'python2-pyzmq'
  'python2-scipy'
  'python2-sip'
  )
makedepends=('cmake')
source=("$pkgname::git://github.com/mantidproject/mantid.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  sed -i 's/NOT NO_OPENCASCADE/ENABLE_OPENCASCADE/' "${srcdir}/mantid/Code/Mantid/Framework/Geometry/CMakeLists.txt"
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYQT4_SIP_DIR=/usr/share/sip/PyQt4 "${srcdir}/mantid/Code/Mantid"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
