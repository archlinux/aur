# Maintainer: masutu <masutu dot arch at gmail dot com>
pkgname=ebumeter
pkgver=0.2.0
pkgrel=1
pkgdesc="Loudness measurement according to EBU-R128."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=(clxclient jack libpng)
source=($url/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('8cf935e3412119042dd3bf4bf87b8b72')

build() {
  cd "$srcdir/$pkgname-$pkgver"/source
  sed -i "s:PREFIX = /usr/local:PREFIX = /usr:" Makefile  
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"/source
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/ebumeter
  install -m 755 ebur128 $pkgdir/usr/bin
  install -m 755 ebumeter $pkgdir/usr/bin
  install -m 644 ../share/* $pkgdir/usr/share/ebumeter
}

# vim:set ts=2 sw=2 et:
