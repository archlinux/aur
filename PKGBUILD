# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog
pkgver=0.3.0
pkgrel=0
url=https://github.com/Igalia/cog
arch=(i686 x86_64 aarch64)
groups=(wpe)
conflicts=(cog-git)
depends=('wpewebkit>=2.24.0' 'wpebackend-fdo>=1.2.0')
makedepends=(cmake)
license=(custom:MIT)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz.asc")
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
md5sums=('4a144065ee8f1f86b2aa686f3e1bf382' 'SKIP')
sha1sums=('6df3af04dfadf4b7dfd09a4230480017a30123e1' 'SKIP')
sha256sums=('6f063c133ad65d153dad08f4f8d912539bfd8fe4ff174a8e3ff34dd80b34330f' 'SKIP')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		"../${pkgname}-${pkgver}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install

	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
