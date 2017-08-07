# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
# Contributor: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=mantid
pkgver=3.10.1
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
  'hdf5'
  'gsl'
  )
makedepends=('cmake')
source=("$pkgname::git+https://github.com/mantidproject/mantid.git#tag=v${pkgver}"
  "https://github.com/mantidproject/mantid/pull/19889.patch")
sha1sums=('SKIP'
  'cf774c353e3487a9770eeb7652dc87abb66c56f4')

build() {
  cd "${srcdir}/mantid"
  patch -p1 -i "${srcdir}/19889.patch"
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
