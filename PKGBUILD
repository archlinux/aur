# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submitter: Bob Finch <w9ya@arparci.net>

pkgname=cwirc
pkgver=2.0.0
pkgrel=2
pkgdesc="X-Chat plugin for sending and receiving raw morse code over IRCxchat"
arch=('i686' 'x86_64')
url="http://myspace.voo.be/pcoupard/cwirc/"
license=('GPL')
depends=('xchat')
makedepends=('pkgconfig')
changelog=Changelog
source=(http://users.skynet.be/ppc/$pkgname/download/$pkgname-$pkgver.tar.gz
	diff.Makefile)

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p0 < ../diff.Makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver

  make all || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver

  mkdir -p $pkgdir/usr/lib/xchat/plugins
  cp cwirc.so $pkgdir/usr/lib/xchat/plugins

  mkdir -p $pkgdir/usr/bin
  cp cwirc_frontend $pkgdir/usr/bin
 
  mkdir -p $pkgdir/usr/lib/cwirc/extensions
  
  install -D -m644 README $pkgdir/usr/share/$pkgname/README
  install -m644 schematics/* $pkgdir/usr/share/$pkgname/ 
}
md5sums=('08930a01c0d94b730e184a79bee7fe0c'
         '66c80955130d49bdf0bd85e9b2d93d74')
sha256sums=('90e3bfa916fb8e5478739dc4d14b111bb2ffd1d1fd8ea81ab43486dc1e7e35c0'
            'c0db6ebe997128e951d00527516fd0b2e48ab7d570b3a00b26c69915feb51eab')
