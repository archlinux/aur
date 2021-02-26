# Maintainer: solopasha <daron439@gmail.com>
pkgname=id3tool
pkgver=1.2a
pkgrel=1
pkgdesc="Command line utility for easy manipulation of the ID3 tags present in MPEG Layer 3 audio files."
arch=('i686' 'x86_64')
url="http://nekohako.xware.cx/id3tool"
license=('custom:BSD')
depends=('glibc')
provides=('id3tool')
source=(http://nekohako.xware.cx/id3tool/$pkgname-$pkgver.tar.gz)
md5sums=('061185562c0d0e6327406d9fc2f194b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 id3tool.1 "${pkgdir}/usr/share/man/man1/id3tool.1.gz"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -rf ${pkgdir}/usr/man
}
