# Maintainer: Sander van Kasteel <info@sandervankasteel.nl>, ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-git"
pkgver=r461.96cdf8f
pkgrel=2
pkgdesc="Hyprland is a dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=(any)
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=(libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols wlroots-git cairo pango)
makedepends=(git cmake ninja gcc gdb)
source=("${_pkgname}::git+https://github.com/vaxerski/Hyprland.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "${srcdir}/${_pkgname}"
	sudo make install
}
