# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Radoslaw Mejer <radmen@radmen.info>

pkgname=contentful-cli
pkgver=1.9.51
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
sha256sums=('c9afbfea832900213f41f85ff8eeba9cb77555b73a4df25c01bef2fdbbc7c511')

PURGE_TARGETS=(*.1 *.1.txt info package.json)

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d $pkgdir/usr/share/{doc,licenses}/$pkgname
	ln -s /usr/lib/node_modules/contentful-cli/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s /usr/lib/node_modules/contentful-cli/README.md "$pkgdir/usr/share/doc/$pkgname/"
	chown -R root:root "$pkgdir/"
}
