_pkgname='river'
pkgname="${_pkgname}-git"
pkgver=r264.59d0fb7
pkgrel=1
pkgdesc='A dynamic tiling wayland compositor.'
arch=('any')
url="https://github.com/ifreund/${_pkgname}"
license=('GPL3')
depends=('zig' 'wlroots')
makedepends=('git' 'wayland-protocols')
provides=('river')
conflicts=('river')
source=("${_pkgname}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	zig build -Drelease-safe
}

package() {
	cd "${_pkgname}"
	zig build -Drelease-safe --prefix "${pkgdir}/usr" install
}
