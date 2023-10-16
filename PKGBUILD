# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wayfire-plugins-shadows-git
pkgdesc='Wayfire plugin that adds shadows around server-side decorated windows'
url=https://github.com/timgott/wayfire-shadows
pkgver=r76.de32395
pkgrel=1
arch=(x86_64)
license=(MIT)
depends=(wayfire)
makedepends=(glm git meson)
source=("${pkgname}::git+${url}")
b2sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build () {
	rm -rf _build
	arch-meson "${pkgname}" _build
	meson compile -C _build
}

package () {
	meson install -C _build --destdir="${pkgdir}"
}
