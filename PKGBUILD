# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-gtk-theme-git
_pkgname=pop-gtk-theme
pkgver=5.3.1.r3.g5ab6f1e4
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
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/pop-os/gtk-theme.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/gtk-theme"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/gtk-theme"
	arch-meson build
	meson compile -C build
}

package() {
	cd "${srcdir}/gtk-theme"
	DESTDIR="${pkgdir}" meson install -C build
}
