# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=piecharts.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.1.0
_rockrel=1
pkgrel=1
pkgdesc='Pie charts for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_luadeps=(grail)
depends=("${_luadeps[@]/#/lua51-}"
         sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e5ac2867dddee10f5f91d9a34650836445b7415be14bcb6fb85b7e7b4101968f')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
