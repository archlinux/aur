# Maintainer Cookie Engineer <@cookiengineer>

_npmname=fx
_npmver=20.0.2
pkgname=nodejs-fx
pkgver=20.0.2
pkgrel=1
pkgdesc="Command-line JSON processing tool"
arch=(any)
url=https://github.com/antonmedv/fx
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha512sums=('06064dca5a6c0dfe55d1ce03c235a7aded9d95df586c46dd3549d7cce0b6589bf847f027246f1cbbb981111864ab1b9edd2de182626bde5aa8a9e29bd8f79d19')
# noextract=($_npmname-$_npmver.tgz)

package() {

	cd "$srcdir";
	install -D -m644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	local _npmdir="$pkgdir/usr/lib/node_modules/";
	mkdir -p "$_npmdir";
	cd "$_npmdir";

	npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";

	# Thanks, npm, for the useless --user flag
	chown -R root:root "$pkgdir/usr";
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

