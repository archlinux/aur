# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=drm_info
pkgver=2.5.0
pkgrel=1
license=(MIT)
pkgdesc='Small utility to dump info about DRM devices'
makedepends=(meson scdoc)
depends=("libdrm>=2.4.115" json-c pciutils)
arch=(x86_64 aarch64)
url=https://gitlab.freedesktop.org/emersion/drm_info
conflicts=(drm_info-git)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
b2sums=('c546063429391ab14043307c3d9e3d00bb35b6d819cabb1982c9ee4b46c6f864de73a4376df911dc836fb9e434317f039c75416ca098196bb14be1889b59e00c')

build() {
	rm -rf build
	arch-meson build "${pkgname}-v${pkgver}" -Dlibpci=enabled -Dman-pages=enabled
	meson compile -C build
}

check () {
	meson test -C build
}

package() {
	meson install -C build --destdir="${pkgdir}"
	install -Dm644 "${pkgname}-v${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
