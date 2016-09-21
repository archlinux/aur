# Maintainer: willemw <willemw12@gmail.com>

_pkgname=ngp
pkgname=$_pkgname-git
pkgver=1.3.r98.g25e0fe5
pkgrel=1
pkgdesc="Ncurses grep tool"
arch=('i686' 'x86_64')
url="https://github.com/jonathanklee/ngp"
license=('GPL')
depends=('ncurses')
makedepends=('cmake' 'git' 'libconfig')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/jonathanklee/ngp.git)
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
}

