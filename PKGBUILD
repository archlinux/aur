# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=mantid
pkgver=3.7.1
pkgrel=1
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
  'hdf5-cpp-fortran'
  'gsl'
  )
makedepends=('cmake')
source=("$pkgname::git://github.com/mantidproject/mantid.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DENABLE_OPENCASCADE=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYQT4_SIP_DIR=/usr/share/sip/PyQt4 \
        "${srcdir}/mantid"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
