# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=1.6.0
_commit=b20f5f249833919a7111256aa3a9b25ab4895823
pkgrel=1
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
