# Maintainer: iggyvolz < iggyvolz at gmail dot com>
pkgbase=wxbin2c
pkgname=('wxbin2c')
pkgver=1.0
pkgrel=1
pkgdesc="A command line tool to create C files from binary files."
arch=('x86_64')
url="https://github.com/iggyvolz/wxbin2c"
license=('custom:beerware')
sha256sums=('e24fcb9d821a47641421b80c22542808d9b6b4aa53df1ec6796299ba9f5d09f5')
makedepends=('gcc')

source=("$pkgname-$pkgver.tar.gz::https://github.com/iggyvolz/wxbin2c/archive/$pkgver.tar.gz")

build() {
	cd "$srcdir/$pkgbase-$pkgver"
    gcc -o wxbin2c wxbin2c.c
}

package() {
	cd "$srcdir/$pkgbase-$pkgver"

    mkdir -p $pkgdir/usr/bin
    mv wxbin2c $pkgdir/usr/bin
    sed -n '/THE/,/Sigala/p' wxbin2c.c |sed 's@^// @@' > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}