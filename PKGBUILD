# Maintainer: Daniel Maslowski <info@oragnecms.org>
# Contributor: mid-kid <esteve.varela@gmail.com>
# based on https://github.com/aur-archive/qt-ponies-git/blob/master/PKGBUILD
_gitname="qt-ponies"
pkgname="$_gitname-git"
pkgver=v0.9.3.g882a8cf
pkgrel=2
pkgdesc="Desktop ponies in Qt"
arch=("i686" "x86_64")
url="https://github.com/myszha/qt-ponies"
license=('GPL')
depends=("qt5-base" "libxfixes")
makedepends=("git")
provides=("qt-ponies")
source=(
  "git://github.com/myszha/$_gitname.git"
  "qt-ponies-qt5.patch"
)
sha256sums=('SKIP'
            '5681360eb583cd25d42200abda9c01c050db69778c63a8a2ab79b6ecbb441034')


pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_gitname"
  # Set default desktop-ponies directory
  sed -i "s/.\/desktop-ponies/\/usr\/share\/qt-ponies\/desktop-ponies/g" src/configwindow.cpp
  # Patch for Qt5 - big kudos to Kiwii for this :)
  patch -p1 < "$srcdir/qt-ponies-qt5.patch"
}

package() {
  cd "$srcdir/$_gitname"
  qmake-qt5
  make
  make INSTALL_ROOT="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
