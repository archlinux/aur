# Maintainer Cookie Engineer <@cookiengineer>

_npmname=fx
_npmver=18.0.1
pkgname=nodejs-fx
pkgver=18.0.1
pkgrel=1
pkgdesc="Command-line JSON processing tool"
arch=(any)
url=https://github.com/antonmedv/fx
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha512sums=('c9b7986e934a3e8778cf96dc2fde58ec09cd15490510dc7aa56fed0aa1771d19975aae4823275241bbcc2764f247f0bae5406124b6d411a8a291b663b9798753')
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

