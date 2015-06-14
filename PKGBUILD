# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: juan pablo gonzalez <lord_jotape@yahoo.com.ar> #Thanks to keenerd and ivo
 
pkgname=libxspf
pkgver=1.2.0
pkgrel=4
pkgdesc="Library that helps applications to read and write XSPF playlists"
url="http://libspiff.sourceforge.net/"
arch=('i686' 'x86_64')
license=('custom')
depends=('uriparser' 'expat' 'gcc-libs')
source=(http://downloads.sourceforge.net/libspiff/$pkgname-$pkgver.tar.bz2)
md5sums=('eceb3bf8fd4af3b09ea06c5c029cd647')

prepare() {
  sed -i '45i #include <unistd.h> // getcwd' \
   "$pkgname-$pkgver/examples/read/read.cpp"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-test
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
