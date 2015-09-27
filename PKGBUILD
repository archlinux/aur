# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nted
pkgver=1.10.18
pkgrel=1
pkgdesc="A free music score editor for Linux."
arch=('i686' 'x86_64')
depends=('harfbuzz' 'gdk-pixbuf2' 'pango' 'gtk2' 'alsa-lib')
license=('GPL')
url="https://vsr.informatik.tu-chemnitz.de/staff/jan/nted/nted.xhtml"
options=('!libtool' '!strip' '!makeflags')
source=(https://vsr.informatik.tu-chemnitz.de/staff/jan/nted/sources/nted-1.10.18.tar.gz http://http.debian.net/debian/pool/main/n/nted/nted_1.10.18-8.debian.tar.xz)
md5sums=('0ca7aa23109171ab643a9b552487bd4b'
         'fc234858017b6174b1a6f8d2a9179d47')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  
  for i in `head -10 $srcdir/debian/patches/series`
  do
    patch -p1 < $srcdir/debian/patches/$i 
  done
  mv configure.in configure.ac
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
