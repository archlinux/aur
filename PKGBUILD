# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=rollup
pkgver=2.74.1
pkgrel=1
pkgdesc="Next-generation ES6 module bundler"
arch=('any')
url="https://rollupjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
changelog=CHANGELOG.md
options=('!emptydirs')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('5b7e51a6705f541e96d17ee310ab59aa338796588086db49156fe53a7988f2f6')

PURGE_TARGETS=('CHANGELOG.md')

package() {
	export NODE_ENV=production
	npm install -g \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		"$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir/"

	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -d "$pkgdir/usr/share/doc/$pkgname/"
	ln -s "/usr/lib/node_modules/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s "/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
