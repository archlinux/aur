# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=ptable.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=4.0.0
_rockrel=1
pkgrel=2
pkgdesc='Paragraph boxes, framed boxes and table packages for the SILE typesetting system'
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
sha256sums=('e714e628cdfc76e2565387c6095ef20dfe4c4fa52fcbcd384a857c750c4c86d6')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
