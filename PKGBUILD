# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=zx
pkgver=6.2.2
_commit=3a66988f44fafd6b0038227200d16cae3d6d7bdf
pkgrel=1
pkgdesc='A tool for writing better scripts'
arch=(any)
url=https://github.com/google/zx
license=(Apache)
depends=(nodejs)
makedepends=(npm git)
source=("git+$url.git#commit=$_commit")
md5sums=(SKIP)

build() {
	cd "$pkgname"
	npm install --production
}

package() {
	cd "$pkgname"

	local _npmdir="$pkgdir/usr/lib/node_modules"
	install -d "$_npmdir/$pkgname"
	cp -r * "$_npmdir/$pkgname"

	local _bindir="$pkgdir/usr/bin"
	mkdir -p "$_bindir"
	ln -s "/usr/lib/node_modules/$pkgname/zx.mjs" "$_bindir/zx"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
