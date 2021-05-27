# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=1.14.0
pkgrel=1
pkgdesc="A tool for writing better scripts"
arch=("any")
url="https://github.com/google/zx"
license=("Apache")
depends=("nodejs")
makedepends=("npm" "git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=("20fd5b811322dbbc4a0838fc0b43c84f5981250200d754f8dc31add109d48461bf9d6f980d9b9e51d194e266749d15e5fc6b20c9d824a393a5f1576d06bb382c")

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
