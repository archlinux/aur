# Maintainer: buckket <buckket@cock.li>
# Contributors: masutu

pkgname=ebumeter
pkgver=0.4.0
pkgrel=1
pkgdesc="Loudness measurement according to EBU-R128."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=(clthreads clxclient jack)
source=($url/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=('802f1cab7984c2f2ec85594461620711')

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
