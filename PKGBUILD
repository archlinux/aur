# $Id$
# Maintainer: Adriano Foschi <adri.foschi@gmail.com>

_pkgname=qgit
pkgname=$_pkgname-git
pkgver=original.143.g7b8f1ff
pkgrel=1
pkgdesc="A GIT GUI viewer built on Qt/C++"
url='https://github.com/tibirna/qgit/'
arch=('x86_64')
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('cmake')
depends=('qt5-base' 'git' 'hicolor-icon-theme')
optdepends=('source-highlight')
#source=("${pkgname}::git://repo.or.cz/qgit4/redivivus.git#tag=${pkgname}-${pkgver}")
source=("git+https://github.com/tibirna/$_pkgname.git")
md5sums=('SKIP') 

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
  cd ${srcdir}/${_pkgname}
  rm -rf build && mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd ${srcdir}/${_pkgname}/build
  make DESTDIR=${pkgdir} install
}


