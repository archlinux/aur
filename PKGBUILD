# Maintainer: Maximilian Stein <theoddbird@posteo.org>
# Contributor: Paul Roy <paul.roy.b@gmail.com>

pkgname=gravit
pkgver=0.5.1
pkgrel=1
pkgdesc="A beautiful gravity simulator for linux that uses OpenGL"
arch=('x86_64' 'i686')
url="http://gravit.slowchop.com"
install=gravit.install
license="GPL"
depends=('sdl_image' 'sdl_ttf')
optdepends=("lua: for spawn scripting"
	    "libpng: for screenshots")
source=(http://gravit.slowchop.com/media/downloads/$pkgname-$pkgver.tgz)
sha256sums=('c7cfd213f0865071da978a9441844910b1f7b49dc10daab94934bf25e43f6e93')



build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --localstatedir=$HOME/.gravit --without-agar
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
  
  #moves configuration files from $prefix/etc/gravit to $prefix/share/gravit - its just more proper.
  install -m644 $pkgdir/usr/etc/gravit/* $pkgdir/usr/share/gravit/
  rm $pkgdir/usr/etc/gravit/*
  rmdir $pkgdir/usr/etc/gravit
  rmdir $pkgdir/usr/etc
  
}