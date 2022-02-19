# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submitter: Bob Finch <w9ya@arparci.net>

pkgname=cwirc
pkgver=2.0.0
pkgrel=3
pkgdesc="X-Chat plugin for sending and receiving raw morse code over IRCxchat"
arch=('i686' 'x86_64')
url="https://directory.fsf.org/wiki/CWirc"
license=('GPL')
depends=('hexchat')
makedepends=('pkgconfig')
changelog=Changelog
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/cwirc/2.0.0-4/cwirc_2.0.0.orig.tar.gz
	diff.Makefile)

prepare() {
  cd $srcdir/$pkgname-$pkgver.orig

  patch -p0 < ../diff.Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver.orig

  make all || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver.orig

  mkdir -p $pkgdir/usr/lib/xchat/plugins
  cp cwirc.so $pkgdir/usr/lib/xchat/plugins

  mkdir -p $pkgdir/usr/bin
  cp cwirc_frontend $pkgdir/usr/bin
 
  mkdir -p $pkgdir/usr/lib/cwirc/extensions
  
  install -D -m644 README $pkgdir/usr/share/$pkgname/README
  install -m644 schematics/* $pkgdir/usr/share/$pkgname/ 
}
md5sums=('0d1f18b6b8e0afa8b8e5fc87769b523b'
         '66c80955130d49bdf0bd85e9b2d93d74')
sha256sums=('a2bd55e3e365f06057e263e2741141f220cee2ee54e192eeb37b3eb883cb6f5e'
            'c0db6ebe997128e951d00527516fd0b2e48ab7d570b3a00b26c69915feb51eab')
