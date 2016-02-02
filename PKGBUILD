# Maintainer: Maxime Poulin <maxpoulin64@gmail.com>
pkgname='nodejs-wstunnel'
_npmname='wstunnel'
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Tunnels a TCP socket over a WebSocket connection"
arch=('any')
url="https://github.com/mhzed/wstunnel"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
md5sums=('ee3c45003b78449d083a760945d9ca9c')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
	
	grep -FRlZ "$startdir" "$pkgdir" | \
		xargs -0 -- sed -i "s|$startdir|/tmp/build|g"
}
