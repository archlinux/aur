# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-gtk-theme-git
_pkgname=pop-gtk-theme
pkgver=4.0.0.b2.r219.gd7e5e73b
pkgrel=1
pkgdesc="A GTK+ theme for Pop!_OS"
arch=("any")
url="https://github.com/pop-os/gtk-theme"
license=('GPL2' 'CCPL')
depends=(
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.24.30"
	"gtk-engine-murrine>=0.98.1"
	"glib2"
)
makedepends=(
	"meson"
	"libsass>=3.3.6"
	"sassc>=3.3.2"
	"git"
	"parallel"
)
optdepends=(
	"inkscape"
	"optipng"
	"gnome-shell"
	"gnome-flashback"
	"budgie-desktop"
	"xfce4-session"
	"mate-desktop"
	"lxde-common"
	"pop-icon-theme-git: Recommended icon theme"
	"pop-shell-theme-git: Recommended shell theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/pop-os/gtk-theme.git")
sha256sums=("SKIP")

build() {
  	cd "gtk-theme"
	meson build && cd build
	ninja
}

package() {
  	cd "gtk-theme"
	cd build
	DESTDIR="${pkgdir}" ninja install
}

pkgver() {
  	cd "gtk-theme"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

