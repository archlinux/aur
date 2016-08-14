#Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
#Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libkeyfinder-git
pkgdesc="Musical key detection for digital audio."
url="http://www.ibrahimshaath.co.uk/keyfinder/"
license=('GPL3')
pkgver=239.0a5ec7f
pkgrel=1

provides=(libkeyfinder)
conflicts=(libkeyfinder)

source=("$pkgname::git://github.com/ibsh/libKeyFinder.git")
sha256sums=('SKIP')
depends=('fftw')
makedepends=('git' 'qt5-base')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$pkgname"

  qmake-qt5
  make
}

package() {
  cd "$srcdir/$pkgname"

  mkdir -p ${pkgdir}/usr/include/keyfinder
  make INSTALL_ROOT="${pkgdir}" install
}
