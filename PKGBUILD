# Maintainer: b00rt00s ( bomby dot zrzuc at gmail dot com )
# Contributor: Andrea Scarpino <andrea@archlinux.org

pkgname=labplot2-svn
_pkgname=labplot2
pkgver=795
pkgrel=1
pkgdesc="A free software data analysis and visualization application"
arch=('i686' 'x86_64')
url='http://labplot.sourceforge.net/'
license=('GPL')
depends=('kdelibs' 'kdebase-runtime' 'gsl')
makedepends=('cmake' 'automoc4' 'subversion')
source=("${_pkgname}::svn+svn://svn.code.sf.net/p/labplot/code/2.0/")
md5sums=('SKIP')

pkgver() {
	cd "${startdir}/${_pkgname}"
	svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}"/${_pkgname}

  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -j 2

}

package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
