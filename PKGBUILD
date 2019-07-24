# Maintainer: loto <robertrmiller at outlook dot com>
# Previous Maintainer: Uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Previous Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=nodejs-coffeelint
_pkgname=coffeelint
pkgver=2.0.6
pkgrel=4
pkgdesc="Style checker for CoffeeScript"
arch=(any)
url="http://www.coffeelint.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/clutchski/coffeelint/archive/v2.0.6.tar.gz"
"LICENSE")
noextract=($_pkgname-$pkgver.tar.gz)

package() {
	cd $srcdir/
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p "$_npmdir"
	cd "$_npmdir"
	npm install --user root -g --prefix="$pkgdir/usr" $_pkgname@$pkgver

	rm -rf "$pkgdir/usr/etc/"

	find "$pkgdir"/usr -type d -exec chmod 755 '{}' + #fix bug https://bugs.archlinux.org/task/56962

	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('f5ff8853b9a53e5facab76d8420c5548' '5a8770b7200a77a54efdc08857c40d50')
