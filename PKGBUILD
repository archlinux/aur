#Maintainer: Lubosz Sarnecki <lubosz@gmail.com> 

_realname=libkeyfinder
pkgname=$_realname-git
pkgver=133.56a9f04
pkgrel=1
pkgdesc="Musical key detection for digital audio."
arch=('i686' 'x86_64')
url="http://www.ibrahimshaath.co.uk/keyfinder/"
license=('GPL3')
depends=('qt5-base' 'fftw' 'boost-libs') 
makedepends=('git' 'boost')
provides=($_realname)
conflicts=($_realname)

_gitname=libKeyFinder

source=("git://github.com/ibsh/libKeyFinder.git" "build.patch")
sha256sums=("SKIP" 'ae4dc6a62290e2efd3ac0c5adc4f9a931567ed3c61d0a7545026e83fbc774a0c')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  patch -p1 < ../../build.patch

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd $_gitname

  make INSTALL_ROOT="${pkgdir}" install
  
  mkdir -p ${pkgdir}/usr/include/keyfinder
  cp ${srcdir}/${_gitname}/*.h ${pkgdir}/usr/include/keyfinder
}
