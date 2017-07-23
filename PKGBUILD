# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-gtk-theme-git
_pkgname=pop-gtk-theme
pkgver="3.90.0.53"
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on the Adapta GTK+ theme."
arch=("any")
url="https://github.com/system76/pop-gtk-theme"
license=('GPL2' 'CCPL')
depends=(
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.32.2"
	"gtk-engine-murrine>=0.98.1"
)
makedepends=(
	"parallel"
	"inkscape"
	"glib2>=2.48.0"
	"librsvg>=2.40.13"
	"libsass>=3.3.6"
	"libxml2"
	"sassc>=3.3.2"
	"git"
)
optdepends=(
	"gnome-shell>=3.18.3"
	"gnome-flashback>=3.18.2"
	"budgie-desktop>=10.2.7"
	"xfce4-session>=4.12.2"
	"mate-desktop>=1.14.0"
	"mate-desktop>=1.14.0"
	"lxde-common>=0.99.1"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
	"pop-icon-theme-git: Recommended icon theme"
	"plank: Elegant, simple, clean dock"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/system76/pop-gtk-theme.git")
sha256sums=("SKIP")

build() {
  	cd "${_pkgname}"
	./autogen.sh --enable-parallel \
				 --enable-nokto    \
				 --enable-gtk_next \
				 --enable-plank
	make
}

package() {
  	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
  	cd "${_pkgname}"
	git describe | cut -d- -f1 | sed 's/^v//'
}
