# Contributor: Niko Rosvall <niko@byteptr.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Co-Maintainer: Zachary Matthews <zacharymatt5@gmail.com>

pkgname=ylva
pkgver=1.7
pkgrel=2
pkgdesc='Command line password manager.'
arch=('i686' 'x86_64')
url='https://github.com/nrosvall'
license=('GPL')
depends=('openssl' 'sqlite')
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::$url/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7c557c0c30a4b3bf0a66cec41e909d491bc84a575e9fc7c0942b8d158bf199cc')

prepare() {
  cd $pkgname-$pkgver/src
  sed -i -e '/^override/d' \
         -e 's/^\(PREFIX=\/usr\)\/local/\1/' \
         Makefile
}

build() {
  cd $pkgname-$pkgver/src
  make
}

package () {
  cd $pkgname-$pkgver/src
  install -Dm755 $pkgname  "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1
  cd ..
  install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
