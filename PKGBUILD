# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=geos-git
pkgver=3.7.0rc1.r9.g1be02b36
pkgrel=1

pkgdesc="C++ port of the Java Topology Suite (git version)"
url="http://trac.osgeo.org/geos/"
license=('LGPL')

arch=('i686' 'x86_64')
depends=('gcc-libs' 'bash')
conflicts=('geos')
provides=('geos')

source=("${pkgname}::git+https://git.osgeo.org/gitea/geos/geos.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  ./autogen.sh 
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
