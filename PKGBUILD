# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Lich ( lich0x2b@gmail.com ) 

pkgname=barewm-git
pkgver=20130311.db69fe5
pkgrel=1
pkgdesc="Bare WM - A minimal fullscreen window manager for Linux"
url="https://github.com/lechatleon/barewm"
license=('GPL')
arch=('i686' 'x86_64')
depends=('xorg-server')
makedepends=('git')
source=('git+https://github.com/lechatleon/barewm')
md5sums=('SKIP')
_gitname="barewm"

pkgver() {
  cd "$_gitname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build(){
  cd "$srcdir/$_gitname"
  unset CFLAGS
  [ -f $startdir/conf.h ] && cp $startdir/conf.h .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
