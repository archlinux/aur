# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=3.1.0
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('3b8e8035afb0a9107216f15f24b54b0d2ec2a7941cf580a62c7a8d8ff70902c7468edd255275a539e8e8123b73a1e372affbe001d88a7ce89bcb82b531ab8b71')

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
