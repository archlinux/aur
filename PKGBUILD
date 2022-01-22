# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=4.3.0
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('45a5fd20a2c5e5f387ec54f41baa13c338a650a822dc9ce474123451f74cac043ca1023c77eb3f9842c03c5596e9d3ce924b6159d43ae672c7c3e46701a96df0')

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

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: syntax=sh
