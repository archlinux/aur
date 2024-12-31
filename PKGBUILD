# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_execname=chokidar
_npmname=chokidar-cli
pkgname=nodejs-${_npmname}
pkgver=3.0.0
pkgrel=3
pkgdesc="Fast cross-platform cli utility to watch file system changes"
arch=(any)
url="https://github.com/open-cli-tools/chokidar-cli"
license=('MIT')
provides=("$_execname")
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('3649e72e2e9b1080bdf07426b29d3f7b6a2db5e16bb0b456d4fe6325a5bd1ab3')

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
