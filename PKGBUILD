# Maintainer Cookie Engineer <@cookiengineer>

_npmname=node-inspect
_npmver=2.0.0
pkgname=nodejs-inspect
pkgver=2.0.0
pkgrel=1
pkgdesc="Official node.js Inspector and Debugger (for use with node --inspect)"
arch=(any)
url=https://github.com/nodejs/node-inspect
license=( "MIT" )
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha512sums=('bda0cd53a15afefb7c82ffcf57e42879220f85c0671cc88d3ad227c5ca237da82ca5083928ff4796850318958869c6a64fc0208aee75785f9fb818eb136e5aeb')

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

