# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl
pkgver=0.4.0
pkgrel=1
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64)
groups=(wpe)
conflicts=('cog' 'cog-git')
makedepends=(cmake)
license=(custom:MIT)
source=("https://wpewebkit.org/releases/releases/cog-${pkgver}.tar.xz"
        "https://wpewebkit.org/releases/releases/cog-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('75a0838ee6c81bb8df1b254f525440a6' 'SKIP')
sha1sums=('284d2a641e6269b296057918602c8c94eb831527' 'SKIP')
sha256sums=('e9c13a51232434b7340a419b1e6f59c40c582cd80c8e60bd9ec7de16c904fc03' 'SKIP')

build () {
	cmake -H"cog-${pkgver}" -Bbuild \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib
	cmake --build build
}

package () {
	DESTDIR="${pkgdir}" cmake --build build --target install

	install -Dm644 "cog-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/cog/COPYING"
}
