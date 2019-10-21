# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-icon-theme-git
_pkgname=pop-icon-theme
pkgver=r2326.27be527bda
pkgrel=1
pkgdesc="An icon theme for Pop!_OS"
arch=("any")
url="https://github.com/pop-os/icon-theme"
license=('CCPL')
makedepends=("git" "meson" "ninja")
optdepends=(
	"gnome-shell"
	"gnome-flashback"
	"budgie-desktop"
	"xfce4-session"
	"mate-desktop"
	"mate-desktop"
	"lxde-common"
	"pop-gtk-theme-git: Recommended gtk theme"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/pop-os/icon-theme.git")
sha256sums=("SKIP")

pkgver() {
  	cd ${srcdir}/${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() { 
  	cd ${srcdir}/${_pkgname}
	meson --prefix='/usr' build
	ninja -C build
}

package() {
  	cd ${srcdir}/${_pkgname}
	DESTDIR="${pkgdir}" ninja -C build install
}
