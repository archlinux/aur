# Maintainer: Yauhen Kirylau <actionless DOT loveless PLUS aur AT gmail MF com>
# Upstream URL: https://github.com/themix-project/themix-plugin-base16

_pkgname=themix-plugin-base16
_reponame=$_pkgname
pkgname="${_pkgname}-git"
pkgver=1.0.1.r0.g56476bc
pkgrel=1
pkgdesc="Import and export plugin for Themix GUI designer to get color palettes from Base16 project"
arch=('x86_64' 'i686')
url="https://github.com/themix-project/${_reponame}"
license=('GPL3')
source=(
	"${_reponame}::git+https://github.com/themix-project/${_reponame}.git#branch=master"
)
md5sums=('SKIP')
depends=(
	'themix-gui'
	'python-pystache'
	'python-yaml'
)
makedepends=(
	'git'
)
optdepends=(
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
	_plugin_name=base16

	cd "${srcdir}/${_reponame}"
	make -f Makefile_oomox_plugin DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
	python -O -m compileall "${pkgdir}${_oomox_dir}/plugins/${_plugin_name}" -d "${_oomox_dir}/plugins/${_plugin_name}"
}

# vim: ft=PKGBUILD
