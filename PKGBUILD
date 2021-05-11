# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=1.4.0
_commit=1508858ae964e49e0e5667860f7075b2a6aa15bf
pkgrel=2
pkgdesc="A tool for writing better scripts"
arch=("any")
url="https://github.com/google/zx"
license=("Apache")
depends=("nodejs")
makedepends=("npm" "git")
source=("git+$url.git#commit=$_commit")
sha256sums=("SKIP")

build() {
	cd "$pkgname"
	npm install --production
}

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules"
	mkdir -p "$_npmdir/$pkgname"
	cp -r "$srcdir/$pkgname"/* "$_npmdir/$pkgname"
	local _bindir="$pkgdir/usr/bin"
	mkdir -p "$_bindir"
	ln -s "/usr/lib/node_modules/$pkgname/zx.mjs" "$_bindir/zx"

	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/license/$pkgname/LICENSE"
}

# vim: syntax=sh
