# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=4.1.1
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('6ce37a5864b4e3e72f280001a8383705748248e9a31d1ed65e2fd290b78787e999a273369751730a577a2f3ef3290196cec66ae16e3f2d6688ff415406eeaeec')

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
