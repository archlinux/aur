# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontproof
pkgver=2.0.0
pkgrel=1
_rockrel=1
pkgdesc='A font design testing class and CLI tool for SILE'
arch=(any)
url="https://github.com/sile-typesetter/$pkgname"
license=(MIT)
depends=(lua
         lua-cliargs
         sile)
makedepends=(luarocks)
_archive="$pkgname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ca2c9dc276150aff1185ad0a6dae7f61df57f65176239b4249910fbe46ebd948')

build() {
	cd "$_archive"
	luarocks make --pack-binary-rock --deps-mode none -- rockspecs/$_rockspec
}

package() {
	cd "$_archive"
	luarocks --tree "$pkgdir/usr" \
		install --deps-mode none --no-manifest -- $_rock
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
