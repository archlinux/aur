# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=madjack
pkgver=0.5
pkgrel=1
pkgdesc="A MPEG Audio Deck for JACK with an OSC based control interface."
arch=('i686') #x86_64 not working
url="http://www.aelius.com/njh/madjack/"
license=('GPL')
depends=('jack' 'liblo' 'libmad')
optdepends=('qt: for building the gui (qmadjack)')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('7660e3c4863beaba37f92bef083239c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export QTDIR=/usr
  export PKG_CONFIG_PATH=/usr/lib/pkgconfig
  unset LDFLAGS
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  [ -f gui/qmadjack ] && install -m 0755 gui/qmadjack $pkgdir/usr/bin/qmadjack
  install -Dm 644 README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
