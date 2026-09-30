# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

_pkgname=Rcompression
_commit=57f26da8331bbc0b4f04b98c500adcc2c5b8809b
pkgname=r-rcompression
pkgver=0.96.0
pkgrel=1
pkgdesc="R interface to zlib and bzip2 for in-memory (de)compression and zip archive creation (omegahat, not on CRAN)"
arch=('x86_64' 'aarch64')
url="https://github.com/omegahat/Rcompression"
license=('Zlib')
depends=('r' 'zlib' 'bzip2')
makedepends=('gcc')
source=("$_pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz" 'rcompression-modern-gcc.patch')
sha256sums=('ccdab37a4a58b8cfb45bb0dd89a85889b45f2fe8c80dbc8cbb1a59ac81a1cf10'
            'b60ce35fdae96ddff2ae0bde2d4677b15d8f580921a60795ac966b497e3d51a7')

prepare() {
	cd "$_pkgname-$_commit"
	patch -Np1 -i "$srcdir/rcompression-modern-gcc.patch"
}

build() {
	R CMD INSTALL "$_pkgname-$_commit" -l "$srcdir"
}

package() {
	install -dm755 "$pkgdir/usr/lib/R/library"
	cp -a --no-preserve=ownership "$srcdir/$_pkgname" "$pkgdir/usr/lib/R/library"
	install -Dm644 "$_pkgname-$_commit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
