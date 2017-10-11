# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=mantid
pkgver=3.11.0
pkgrel=1
pkgdesc="Data analysis toolkit for neutron based instrument data"
url="http://www.mantidproject.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=(
  'boost-libs'
  'glu'
  'gperftools'
  'gsl'
  'hdf4'
  'hdf5'
  'intel-tbb'
  'jsoncpp'
  'libnexus'
  'libxslt'
  'muparser'
  'opencascade'
  'poco'
  'python2'
  'python2-dateutil'
  'python2-h5py'
  'python2-numpy'
  'python2-pyqt4'
  'python2-pyzmq'
  'python2-qtconsole'
  'python2-scipy'
  'python2-sip'
  'python2-yaml'
  'qscintilla'
  'qtwebkit'
  'qwt5'
  'qwtplot3d'
  )

makedepends=(
  'boost'
  'cmake'
  'python2-sphinx'
  'python2-sphinx-bootstrap-theme'
  )
source=("$pkgname::git+https://github.com/mantidproject/mantid.git#tag=v${pkgver}")
sha1sums=('SKIP')

build() {
  cd "${srcdir}/mantid"
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DCMAKE_CXX_VISIBILITY_PRESET=default \
        "${srcdir}/mantid"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
