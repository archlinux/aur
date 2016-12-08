# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Sascha Bennek <s.bennek@gmx.de>
pkgname=videogen
pkgver=0.33
pkgrel=2
pkgdesc="generates modelines for videocards"
arch=('i686' 'x86_64')
url="http://www.dynaweb.hu/opensource/videogen/"
license=('GPL2')
#groups=()
depends=('bc' 'glibc>=2.7-1')
makedepends=('pkgconfig')
source=(http://www.dynaweb.hu/opensource/videogen/download/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('41d0b11c245cb0bcc497c592ab6b4190')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed "s|/usr/local/bin|$pkgdir/usr/bin|" <Makefile >Makefile2
  sed "s|/usr/local/man|$pkgdir/usr/man|" <Makefile2 >Makefile
  rm -f Makefile2
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/man/man1
  make || return 1
  echo make DESTDIR="$pkgdir/$pkgname" install
  make DESTDIR="$pkgdir/$pkgname" install
}
