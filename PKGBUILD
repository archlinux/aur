# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/oomox-gtk-theme

_pkgname=themix-theme-oomox
_reponame=oomox-gtk-theme
pkgname="${_pkgname}-git"
pkgver=1.11.1.r23.g20658006
pkgrel=1
pkgdesc="Oomox theme plugin
 (GTK2, GTK3, Cinnamon, Metacity, Openbox, Qt5ct, Unity, Xfwm) for Themix GUI designer.
 Have a hack for HiDPI in GTK2."
arch=('x86_64' 'i686')
url="https://github.com/themix-project/oomox-gtk-theme"
license=('GPL3')
source=(
	"${_reponame}::git+https://github.com/themix-project/oomox-gtk-theme.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'gtk3'
	'glib2'  # oomox, materia, arc
	'gdk-pixbuf2'  # oomox, materia, arc
	'gtk-engine-murrine'  # oomox, materia, arc
	'gtk-engines'  # oomox, materia, arc
	'sassc'  # oomox, materia, arc
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
)
makedepends=(
	'git'
	'python'
)
optdepends=(
	'themix-gui: GUI'
)
options=(
	'!strip'
)
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	_oomox_dir=/opt/oomox
	_plugin_name=theme_oomox

	cd "${srcdir}/${_reponame}"
	make -f Makefile_oomox_plugin DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
	python -O -m compileall "${pkgdir}${_oomox_dir}/plugins/${_plugin_name}" -d "${_oomox_dir}/plugins/${_plugin_name}"
}

# vim: ft=PKGBUILD
