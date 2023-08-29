# Maintainer: Bernardo Kuri <aur+rollup@bkuri.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=rollup
pkgver=3.28.1
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
sha256sums=('e5e9b7504594172da43015a1cc9b40a5c18230a93ca9180f3a433ae28785fbc1')

PURGE_TARGETS=('CHANGELOG.md')

package() {
	export NODE_ENV=production
	npm install -g \
		--cache "$srcdir/npm-cache" \
		--prefix "$pkgdir/usr" \
		"$pkgname-$pkgver.tgz"
	chown -R root:root "$pkgdir/"

	install -dv "$pkgdir/usr/share/licenses/$pkgname/" "$pkgdir/usr/share/doc/$pkgname/"
	ln -sv "/usr/lib/node_modules/$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -sv "/usr/lib/node_modules/$pkgname/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
