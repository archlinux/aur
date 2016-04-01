# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Based on adplug package by Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=adplug-mame
pkgver=2.2.1
pkgrel=2
pkgdesc="AdLib sound player library"
arch=('i686' 'x86_64')
url="http://adplug.github.io"
license=('LGPL')
depends=('libbinio')
provides=('adplug')
conflicts=('adplug')
source=(https://github.com/adplug/adplug/releases/download/adplug-$pkgver/adplug-$pkgver.tar.bz2
        http://www.shikadi.net/adplug/files/adplug-2.2_mame.patch.zip)
md5sums=('8f815fd5d254de0fe5df818df9d1d8af'
         '1702935614e1cb401a9d556308e9f841')

prepare() {
  cd "$srcdir/adplug-$pkgver"

  patch -p1 -i $srcdir/adplug-2.2_mame.patch

  autoreconf -fis
}

build() {
  cd "$srcdir/adplug-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/adplug-$pkgver"
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:
