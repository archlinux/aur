# Contributor: Niko Rosvall <niko@byteptr.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Zachary Matthews <zacharymatt5@gmail.com>

pkgname=ylva
pkgver=1.4
pkgrel=1
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://www.${pkgname}passwordmanager.com/'
license=('GPL')
depends=('openssl' 'sqlite')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nrosvall/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9841b73c9412cd596502ac7f8b2f2168ce87763e2edce4506ee1d925eab5f5a1')

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
