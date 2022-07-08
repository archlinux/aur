# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=contentful-cli
pkgver=1.14.18
pkgrel=1
pkgdesc="Official Contentful CLI"
arch=('any')
license=('MIT')
url="https://github.com/contentful/contentful-cli"
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4cf4f96ac001ffa4bb84266efb200d75a22c115b77d355b996efc1add801c19c')

PURGE_TARGETS=(*.1 *.1.txt info package.json)

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d $pkgdir/usr/share/{doc,licenses}/$pkgname
	ln -s \
		/usr/lib/node_modules/contentful-cli/LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	ln -s \
		/usr/lib/node_modules/contentful-cli/README.md \
		"$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
