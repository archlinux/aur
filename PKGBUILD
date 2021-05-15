# Maintainer: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Ameysh <trader9@gmail.com>
# Contributor: xsmile <sascha_r gmx de>
pkgname=ta-lib
pkgver=0.4.0
pkgrel=5
pkgdesc='A library providing common functions for the technical analysis of financial market data'
url='http://ta-lib.org'
license=('BSD')
arch=('x86_64' 'i686')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz"
        "$pkgname-$pkgver-asneeded.patch"
	"fix-werror-format-security.patch"
        'LICENSE')
md5sums=('308e53b9644213fc29262f36b9d3d9b9'
         '5001b2792dcde7189c6a9bc79da09e53'
	 '2aa3764f7cb2e75177280897d7f56fb8'
         '38c1c6fdece39f5f1199d74ebf7f29bf')

prepare() {
  cd "$srcdir/$pkgname"

  # https://gitweb.gentoo.org/repo/gentoo.git/tree/sci-libs/ta-lib/files/ta-lib-0.4.0-asneeded.patch
  patch -Np1 -i "$srcdir/$pkgname-$pkgver-asneeded.patch"
  patch -Np1 -i "$srcdir/fix-werror-format-security.patch"
}

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
