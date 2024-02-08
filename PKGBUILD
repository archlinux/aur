# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontproof
pkgver=2.0.11
pkgrel=2
_rockrel=1
pkgdesc='A font design testing class and CLI tool for SILE'
arch=(any)
url="https://github.com/sile-typesetter/$pkgname"
license=(MIT)
depends=(lua51-cliargs
         sile)
makedepends=(luajit
             luarocks)
_archive="$pkgname-$pkgver"
_rock="$_archive-$_rockrel.all.rock"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('3e45b718301812b051a1dbf21c53e1cef993196a92ce73c3dda384b7f2be94f3')

prepare() {
	cd "$_archive"
	luarocks init
	luarocks --lua-version 5.1 config --scope project lua_interpreter luajit
}

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest -- rockspecs/$_rockspec
	sed -i -e "s!$pkgdir!!" "$pkgdir/usr/bin/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
