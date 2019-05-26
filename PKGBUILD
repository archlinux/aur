# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: Zachary Matthews <zacharymatt5@gmail.com>

pkgname=ylva
pkgver=1.5
pkgrel=2
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.ylvapasswordmanager.com/'
license=('GPL')
depends=('openssl' 'sqlite')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nrosvall/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e4351032a70e8dc12189e0bd0d3b22e7fb01f87ad1c9073150f54fb960531bca')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
         Makefile
}

build() {
  cd $pkgname-$pkgver
  make
}

package () {
  cd $pkgname-$pkgver
  install -Dm755 "$srcdir/$pkgname-$pkgver"/$pkgname  "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname-$pkgver"/$pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  install -Dm644 "$srcdir/$pkgname-$pkgver"/README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 "$srcdir/$pkgname-$pkgver"/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
