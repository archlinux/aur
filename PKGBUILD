# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/oomoxify

_pkgname=themix-export-spotify
_reponame=oomoxify
pkgname="${_pkgname}-git"
pkgver=1.2.r3.g931685f
pkgrel=1
pkgdesc="Export plugin for Themix GUI designer to apply color palettes to Spotify desktop player"
arch=('x86_64' 'i686')
url="https://github.com/themix-project/${_reponame}"
license=('GPL3')
source=(
	"${_reponame}::git+https://github.com/themix-project/${_reponame}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'grep'
	'bc'
	'zip'
	'polkit'
)
makedepends=(
	'git'
	'python'
)
optdepends=(
	'themix-gui: GUI'
	'gksu: for applying Spotify theme from GUI without polkit'
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
	_plugin_name=oomoxify

	cd "${srcdir}/${_reponame}"
	make -f Makefile_oomox_plugin DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
	python -O -m compileall "${pkgdir}${_oomox_dir}/plugins/${_plugin_name}" -d "${_oomox_dir}/plugins/${_plugin_name}"
}

# vim: ft=PKGBUILD
