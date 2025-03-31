# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=highlighter.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.2.1
_rockrel=1
_scintil_sha=a16207a779afea341fc477bb5dbf17fc304dccc6
pkgrel=2
pkgdesc='A code syntax higlighting package for the SILE typesetting system'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
_siledeps=(labelrefs)
depends=(sile
         "${_siledeps[@]/#/sile-}")
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
	https://github.com/orbitalquark/scintillua/archive/$_scintil_sha.zip)
sha256sums=('dc3cb31187d26a7b87079c13d19d26631e1757d44086df5b97a6d60fa18f2df7'
            '16a93350d4d342b35d2dda820d8cddb3f8ef35c2d9e2a7eeac80821ade3ee6e8')

prepare() {
	cd "$_archive"
	rm -rf scintillua
	ln -sf "../scintillua-$_scintil_sha" scintillua
}

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_archive-$_rockrel.rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
