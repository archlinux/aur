# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='General-purpose library specifically developed for the WPE-flavored port of WebKit.'
pkgname=wpebackend
pkgver=0.2.0
pkgrel=4
url=https://github.com/WebPlatformForEmbedded/WPEBackend
arch=(x86_64 i686)
groups=(wpe)
makedepends=(cmake opengl-driver)
depends=(gcc-libs)
license=(custom:BSD)
source=("https://wpewebkit.org/releases/${pkgname}-${pkgver}.tar.xz")
md5sums=('d04e44a32709dbb763ce1fcfc28bc6d8')
sha1sums=('4089cac12877ee1e09372953a281a46b8c8951e9')
sha256sums=('ce33ff29b04175cb6fe6e6597a4b5e8ec9da0b8b5ae0745848902ac935d65823')

prepare () {
	mkdir -p _build
}

build () {
	cd _build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		"../${pkgname}-${pkgver}"
	cmake --build .
}

package () {
	DESTDIR="${pkgdir}" cmake --build _build --target install
	install -Dm644 "${pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
