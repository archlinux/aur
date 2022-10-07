# Maintainer: emersion <contact emersion fr>
pkgname=drm_info-git
_pkgname=drm_info
pkgver=2.4.0.r0.g4f4d727a
pkgrel=1
license=('MIT')
pkgdesc='Small utility to dump info about DRM devices'
makedepends=("meson" "git" "scdoc")
depends=("libdrm" "json-c" "pciutils")
arch=("x86_64")
url='https://gitlab.freedesktop.org/emersion/drm_info'
source=("${_pkgname}::git+https://gitlab.freedesktop.org/emersion/drm_info.git")
sha1sums=('SKIP')
provides=('drm_info')
conflicts=('drm_info')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	arch-meson build/
	ninja -C build/
}

package() {
	cd "${srcdir}/${_pkgname}"

	DESTDIR="$pkgdir/" ninja -C build/ install
}
