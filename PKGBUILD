# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=1.2.2
_commit=30743eba3b3e1407b8780808e201dec7dfdc6834
pkgrel=1
pkgdesc="A tool for writing better scripts"
arch=("any")
url="https://github.com/google/zx"
license=("Apache")
depends=("nodejs")
makedepends=("npm")
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
