# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=drm_info
pkgver=2.4.0
pkgrel=1
license=(MIT)
pkgdesc='Small utility to dump info about DRM devices'
makedepends=(meson scdoc)
depends=(libdrm json-c pciutils)
arch=(x86_64 aarch64)
url=https://gitlab.freedesktop.org/emersion/drm_info
conflicts=(drm_info-git)
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
b2sums=('8a7d367eca019e3f0ce85e953460dff4c082f7e3cd4d5a33f0e0b0e85ad1ee1ce468b3ad2b2dd27b3b426ab1b93b08c984747392470a50b853bb61079be60536')

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
