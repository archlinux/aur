# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=4.0.0
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('192384ca67cb5c738591a1fa2483fa352f7dee21227ed9b64a36a4efe94eac290b98f72ebe1ba8684a877be7b05e84603957a162083e0ef7bb59ae96bd921c13')

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
