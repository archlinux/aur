# Maintainer:  <gucong@gc-desktop>
pkgname=engrid-git
_gitname=engrid
pkgver=20150810.e9804d56
pkgrel=1
pkgdesc="open-source mesh generation"
arch=('i686' 'x86_64')
url="http://engits.eu/en/engrid"
license=('GPL')
depends=(vtk qt4 cgal)
makedepends=(git subversion)
source=("git+https://github.com/enGits/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

prepare() {
  cd "$srcdir/$_gitname"
  
  [ -e build ] && rm -rf build
  mkdir build
}

build() {
  cd "$srcdir/$_gitname/build"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../src
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
