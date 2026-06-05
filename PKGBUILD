# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=drm_info
pkgver=2.10.0
pkgrel=1
license=(MIT)
pkgdesc='Small utility to dump info about DRM devices'
makedepends=(meson scdoc)
depends=("libdrm>=2.4.115" libdisplay-info json-c pciutils)
arch=(x86_64 aarch64)
url=https://gitlab.freedesktop.org/emersion/drm_info
conflicts=(drm_info-git)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
b2sums=('bc9bb03eeef1673157e924ece031365dcea6dcb1d50b9c4758186bf28c9cefc98c29deb82c0c8841d5504a00e7b8d3b7a8eca156e0cadcf69e029f3d3292d86d')

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
