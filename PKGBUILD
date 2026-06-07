# Maintainer: Swarnim B (https://smarniw.com)
pkgname=c3fmt
pkgver=0.3.0
pkgrel=1
pkgdesc="Code formatter for the C3 language"
arch=('x86_64')
url="https://github.com/lmichaudel/c3fmt"
license=('MIT')
depends=(
	'tree-sitter'
)
makedepends=(
	'c3c'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lmichaudel/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('490d4953ae70862efa4951ab70d2f2a5e31e0e12a3ab1e74bef6fcffca28b4a5')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	c3c build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	c3c test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
