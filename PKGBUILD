# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-shell-theme-git
_pkgname=gnome-shell-theme
pkgver="r98.21a1337"
pkgrel=1
pkgdesc="This is the GNOME Shell theme that goes along with the Pop GTK Theme."
arch=("any")
url="https://github.com/pop-os/gnome-shell-theme"
license=('GPL2' 'CCPL')
depends=(
	"gnome-shell>=3.18.3"
	"pop-gtk-theme-git"
)
optdepends=(
	"pop-icon-theme-git: Recommended icon theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/pop-os/gnome-shell-theme.git")
sha256sums=("SKIP")

build() {
	cd "${_pkgname}"                                                             
	make clean
	make
}

package() {
	cd "${_pkgname}"                                                             
	make DESTDIR="${pkgdir}" install
}

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
