# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=qrcode.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.1.0
_rockrel=1
pkgrel=1
pkgdesc='QR code package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(BSD-3-clause)
_luadeps=(grail)
depends=("${_luadeps[@]/#/lua51-}"
         sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('b339c75be526d2a11eddc8a90a02b55616df21a0c5f3deb72c59088afdfff8e6')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
