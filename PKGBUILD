# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=printoptions.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.0
_rockrel=1
pkgrel=2
pkgdesc='Image tools for professional printers with the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('66961fc63b3d441a78d25767f263a0bddeb62691a6700b808dc81392d48c64f0')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
