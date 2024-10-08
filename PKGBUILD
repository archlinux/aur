# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=printoptions.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=1.2.0
_rockrel=1
pkgrel=1
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
sha256sums=('d94e626d37b7e355eeebfe4fb0bced44bbfe522e98b83c0e32af7d11440e0a6f')

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
