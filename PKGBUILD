# Maintainer: willemw <willemw12@gmail.com>
# Contributor: totoloco <totoloco at gmail dot com>

_pkgname=pmus
pkgname=$_pkgname-git
pkgver=0.42.r399.g8c89184
pkgrel=1
pkgdesc="Practical Music Search is a highly configurable, ncurses-based client for MPD"
arch=('i686' 'x86_64')
url="https://ambientsound.github.io/pms/"
license=('GPL')
makedepends=('cmake' 'git' 'pandoc')
depends=('libmpdclient' 'ncurses')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/ambientsound/pms.git#branch=0.42.x)
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags --match "[0-9]*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install

  install -dm755 "$pkgdir/usr/share/pms/examples"
  install -m644 examples/* "$pkgdir/usr/share/pms/examples"
}

