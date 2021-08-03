# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=drm_info
pkgver=2.3.0
pkgrel=2
license=(MIT)
pkgdesc='Small utility to dump info about DRM devices'
makedepends=(meson git)
depends=(libdrm json-c pciutils)
arch=(x86_64)
url=https://github.com/ascent12/drm_info
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=(drm_info-git)
sha512sums=('111b558f36f7fdcc17bd77be0f4965cc4b69ab63149ea326b16566156e3d619f47033bee8164d9d28dc540c0a453ef774249ec3d37587f42ebe6c97fcc7925d2')

build() {
	rm -rf build
	arch-meson build "${pkgname}-${pkgver}"
	meson compile -C build
}

check () {
	meson test -C build
}

package() {
	meson install -C build --destdir="${pkgdir}"
}
