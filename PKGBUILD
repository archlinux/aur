# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=ptable.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=2.0.1
_rockrel=1
pkgrel=1
pkgdesc='Paragraph boxes, framed boxes and table packages for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(silex)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('65faf16a92d5369697bffd3f2b12ba9c4a1abf9cab7dc9a3a1ea408daf94c0b1')

package() {
	cd "$_archive"
	luarocks --lua-version="5.1" --tree="$pkgdir/usr/" \
		make --deps-mode=none --no-manifest "$_rockname-$pkgver-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
