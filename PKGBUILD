# Maintainer: Daniel Maslowski <info@oragnecms.org>
# Contributor: mid-kid <esteve.varela@gmail.com>
# based on https://github.com/aur-archive/qt-ponies-git/blob/master/PKGBUILD
_gitname="qt-ponies"
pkgname="$_gitname-git"
pkgver=v0.9.3.g882a8cf
pkgrel=1
pkgdesc="Desktop ponies in Qt"
arch=("i686" "x86_64")
url="https://github.com/myszha/qt-ponies"
license=('GPL')
depends=("qt4" "libxfixes")
makedepends=("git")
provides=("qt-ponies")
source=("git://github.com/myszha/$_gitname.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  # Set default desktop-ponies directory
  sed -i "s/.\/desktop-ponies/\/usr\/share\/qt-ponies\/desktop-ponies/g" src/configwindow.cpp
}

package() {
  cd "$srcdir/$_gitname"
  qmake-qt4
  make
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
