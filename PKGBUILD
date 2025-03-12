# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=silex.sile
pkgname=("sile-${_rockname%.sile}")
pkgver=0.9.0
_rockrel=1
pkgrel=1
pkgdesc='Extension layer for SILE and resilient'
arch=(any)
url="https://github.com/Omikhleia/$_rockname"
license=(MIT)
depends=(sile)
makedepends=(lua51
             luarocks)
_archive="$_rockname-$pkgver"
_rockspec="$_archive-$_rockrel.rockspec"
source=("$url/archive/v$pkgver/$_archive.tar.gz"
	https://luarocks.org/manifests/omikhleia/$_rockspec)
sha256sums=('ee55421063f7a2f453db23c36321874de25a4de7cafd5dbdf045a06e37c36d6d'
            'bb51b2cfbdebb097c9715748a954db6d1b2536b12d474fc41e13d24e81920bd8')

prepare() {
	cd "$_archive"
	# https://github.com/Omikhleia/silex.sile/issues/21
	cp ../$_rockspec rockspecs
}

package() {
	cd "$_archive"
	luarocks --lua-version 5.1 --tree "$pkgdir/usr/" \
		make --deps-mode none --no-manifest "rockspecs/$_rockspec"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
