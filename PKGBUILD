# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/oomox-gtk-theme

_pkgname=themix-theme-oomox
_reponame=oomox-gtk-theme
pkgname="${_pkgname}-git"
pkgver=1.11.1.r26.g1a46df76
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
	'glib2'
	'gdk-pixbuf2'
	'gtk-engine-murrine'
	'gtk-engines'
	'sassc'
	'librsvg'
	'sed'
	'findutils'
	'grep'
	'bc'
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
conflicts=(
    $_pkgname
    'oomox'
    'oomox-git'
)

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
