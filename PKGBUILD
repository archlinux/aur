# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=1.8.0
pkgrel=1
pkgdesc="A tool for writing better scripts"
arch=("any")
url="https://github.com/google/zx"
license=("Apache")
depends=("nodejs")
makedepends=("npm" "git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=("e94ac352126f622d6b8dc2c30149188d9c2b34c3ecd54e3c2fa7ba66295e6ab1cc4f5ceabf6c41619ee9415b0b26fab53f5ef345dad37ad3c0a176d9d73cc5b7")

build() {
	cd "$pkgname-$pkgver"
	npm install --production
}

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules"
	mkdir -p "$_npmdir/$pkgname"
	cp -r "$srcdir/$pkgname-$pkgver"/* "$_npmdir/$pkgname"
	local _bindir="$pkgdir/usr/bin"
	mkdir -p "$_bindir"
	ln -s "/usr/lib/node_modules/$pkgname/zx.mjs" "$_bindir/zx"

	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/license/$pkgname/LICENSE"
}

# vim: syntax=sh
