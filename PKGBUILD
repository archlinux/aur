# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=fsharp
pkgver=4.0.1.8
pkgrel=1
pkgdesc="The Open Edition of the F# compiler, core library and tools"
arch=('any')
url="http://fsharp.org/"
license=('Apache')
depends=('mono>=4.0.3.20')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fsharp/$pkgname/archive/$pkgver.tar.gz"
"Makefile")
md5sums=('f4a4f8b2969157dfab821419c48f7e47'
         'b287165bbe0ebc4d876e4ee8aba3c081')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  cp $srcdir/Makefile $srcdir/fsharp-$pkgver/src/fsharp
  sed -i -e "s|<SRCDIR>|$srcdir|g" $srcdir/fsharp-$pkgver/src/fsharp/Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  find "${pkgdir}" \
	 -name "*.xml" -exec sed -i -e "s|$srcdir||g" '{}' \;
}
