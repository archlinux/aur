# Maintainer: Sander van Kasteel <info at sandervankasteel dot nl>

pkgname=hyprland-git
_pkgname=${pkgname%-*}
pkgver=1.0.0.6911ed3
pkgrel=1
pkgdesc="Hyprland is a Dynamic Tiling Wayland Compositor in early development stages"
arch=(any)
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=('gdb' 'ninja' 'gcc' 'cmake' 'libxcb' 'xcb-proto' 'xcb-util' 'xcb-util-keysyms' 'libxfixes' 'libx11' 'libxcomposite' 'xorg-xinput' 'libxrender' 'pixman' 'wayland-protocols' 'wlroots-git')
optdepends=()
source=(git@github.com:vaxerski/Hyprland.git)
sha256sums=('SKIP')

source=(
	"${_pkgname}::git+${url}.git"
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
