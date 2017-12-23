# Contributor: Niko Rosvall <niko@byteptr.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Zachary Matthews <zacharymatt5@gmail.com>

pkgname=titan
pkgver=1.2
pkgrel=1
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.titanpasswordmanager.org/'
license=('GPL')
depends=('openssl' 'sqlite')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nrosvall/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1d87fac29da00ebb5c9432d3a2007837818b06c653a8559c43112e322a94823b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
         Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver"/$pkgname  "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname-$pkgver"/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 "$srcdir/$pkgname-$pkgver"/README "$pkgdir"/usr/share/doc/"$pkgname"/README
  install -Dm644 "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
