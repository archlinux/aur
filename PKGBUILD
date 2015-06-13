# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=josl
pkgver=0.5.6
pkgrel=1
pkgdesc="An interpreted, GC'd, dynamic, modern and practical stack based language."
arch=('i686' 'x86_64')
url="https://web.archive.org/web/20121022001053/http://www.josl.org/"
license=('custom')
depends=('glibc')
source=(http://www.josl.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('dc777715c8b7f5c484be197dcad8f5c0')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  cp config.mak.tmpl config.mak
  sed -i "s|PLATFORM = none|PLATFORM = linux|" config.mak
  sed -i "s|/home/jeremy/josl|$pkgdir/usr|" config.mak
  # Enable readline?  Nah.
  make
  make test
  make install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
