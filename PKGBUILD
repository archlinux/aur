# <Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=titan
pkgver=1.1
pkgrel=1
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.titanpasswordmanager.org/'
license=('GPL')
depends=('openssl' 'sqlite')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nrosvall/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('875f07423ddf2981dc07a464794fc8e258f2415335233c8d533d252a59e1baf0')

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
