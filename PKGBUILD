# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_npmname=concurrently
_npmalias=conc
pkgname=nodejs-${_npmname}
pkgver=9.1.2
pkgrel=1
pkgdesc="Run multiple commands concurrently"
arch=(any)
url="https://github.com/open-cli-tools/concurrently"
license=('MIT')
provides=("$_npmname" "$_npmalias")
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('8945b1d4c4439b9d5aed78961f43f646a69aaf16b772159b27eabcad141431bf')

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
