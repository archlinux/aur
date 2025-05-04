# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=piecharts.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.0
_rockrel=1
pkgrel=2
pkgdesc='Pie charts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(GPL-3.0-only)
_luadeps=(grail)
depends=("${_luadeps[@]/#/lua51-}"
         sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('7a2405e63c51fa756f56b3c99edea18ba689f2ad006879bc0fbefb2c95f749c9')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
