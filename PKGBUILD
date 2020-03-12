# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=pop-shell-theme-git
_pkgname=gnome-shell-theme
pkgver=r182.8c7ef1b
pkgrel=1
pkgdesc="This is the GNOME Shell theme that goes along with the Pop GTK Theme."
arch=("any")
url="https://github.com/pop-os/gnome-shell-theme"
license=('GPL2' 'CCPL')
depends=(
	"gnome-shell>=3.18.3"
	"pop-gtk-theme-git"
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.24.30"
	"gtk-engine-murrine>=0.98.1"
	"glib2"
)
makedepends=(
	"inkscape"
	"optipng"
	"libsass>=3.3.6"
	"sassc>=3.3.2"
	"git"
	"parallel"
)
optdepends=(
	"gnome-flashback"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
	"pop-icon-theme-git: Recommended icon theme"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/pop-os/gnome-shell-theme.git")
sha256sums=("SKIP")

pkgver() {
            cd "$srcdir/$_pkgname"
            echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

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
