# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname=nodejs-requirejs
_npmname=requirejs
pkgver=2.2.0
pkgrel=1
pkgdesc="Node.js adapter for RequireJS"
arch=("any")
url="http://github.com/jrburke/r.js"
license=('BSD' 'MIT')
depends=('nodejs' 'npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
md5sums=('e21da761941c3d5bd760c6d27196f5f7')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install -g --prefix "$pkgdir/usr" "$srcdir"/$_npmname-$pkgver.tgz
	
	grep -FRlZ "$startdir" "$pkgdir" | \
		xargs -0 -- sed -i "s|$startdir|/tmp/build|g"
}
