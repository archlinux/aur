# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=qrcode.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.1.0
_rockrel=1
pkgrel=2
pkgdesc='QR code package for the SILE typesetting system'
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
sha256sums=('c654290e60f0403b73d0330fb19e902b56e371e8e199306fbcbdd9d388987ccd')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
