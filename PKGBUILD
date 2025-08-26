# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=concurrently
_npmalias=conc
pkgname=nodejs-${_npmname}
pkgver=9.2.1
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/open-cli-tools/concurrently"
license=('MIT')
provides=("$_npmname" "$_npmalias")
depends=('nodejs' 'python')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5e2610a97b8da4fe42c5e710fdeac01dec965a7b1c8a0ff4980308a4774135f6')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

	# Drop strange dirs
	rm -rf "$pkgdir/usr/lib/node_modules/root"

	# Fix permissions
	find "$pkgdir/usr" -type d -exec chmod 755 {} \;

	# License
	install -Dm644 "/usr/lib/node_modules/concurrently/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# Readme
	install -Dm644 "/usr/lib/node_modules/concurrently/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
