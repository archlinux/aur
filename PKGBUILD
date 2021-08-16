# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=3.0.0
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('e07c6e48b51d156ea504f9ad09af8592c315cfd1b9e70b0f3dc2a01b28677b64e14611dc2ec3ba4eccc8f1f6ef95865d075e49132dd7355747d07922fa4cdc51')

build() {
	cd "$pkgname-$pkgver"
	npm install --production
}

package() {
	cd "$pkgname-$pkgver"

	local _npmdir="$pkgdir/usr/lib/node_modules"
	install -d "$_npmdir/$pkgname"
	cp -r * "$_npmdir/$pkgname"

	local _bindir="$pkgdir/usr/bin"
	mkdir -p "$_bindir"
	ln -s "/usr/lib/node_modules/$pkgname/zx.mjs" "$_bindir/zx"

	install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
}

# vim: syntax=sh
