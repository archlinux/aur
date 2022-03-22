# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=drm_info
pkgver=2.3.0
pkgrel=3
license=(MIT)
pkgdesc='Small utility to dump info about DRM devices'
makedepends=(meson git)
depends=(libdrm json-c pciutils)
arch=(x86_64 aarch64)
url=https://github.com/ascent12/drm_info
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
conflicts=(drm_info-git)
sha512sums=('111b558f36f7fdcc17bd77be0f4965cc4b69ab63149ea326b16566156e3d619f47033bee8164d9d28dc540c0a453ef774249ec3d37587f42ebe6c97fcc7925d2')
b2sums=('c06ad2ce028ad1bfb85b4db9a309f33ebc1cfcf476f184408a1fc7305bca5742fe4256e5d9a573c9731f459c48d53d43f78a3db6a99e76b986b72fdc1c557d51')

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
