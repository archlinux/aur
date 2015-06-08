# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=oxygen-cursors-extra
_kdever_=4.14.3
pkgver=4.11.14
pkgrel=1
pkgdesc="KDE's Oxygen mouse cursor theme - the extra flavours"
arch=("any")
url="http://www.kde.org"
license=("GPL3")
makedepends=('pkgconfig' 'cmake' 'automoc4' 'inkscape' 'libltdl' 'xorg-xcursorgen')
#optdepends=("kdebase-workspace: contains the default cursor colours")
options=(!emptydirs)
source=("http://download.kde.org/stable/${_kdever_}/src/kde-workspace-${pkgver}.tar.xz")

# Cursor size
_cursorsize_=""
#_cursorsize_="-big"

# Theme list
_themelist_="bluecurve brown cherry chrome desert emerald green grey honeycomb hot_orange lilac midnight_meadow navy norway obsidian obsidian-hc olympus olympus-inv orchid oxygen peach purple red red-argentina sea_blue steel terra terra_green violet viorange whitewater wonton"
#_themelist_="${_themelist_} black blue white yellow zion"

build() {
	cd "${srcdir}"/kde-workspace-${pkgver}/cursors/src

	cmake .

	for theme in ${_themelist_}; do
		make theme-${theme}${_cursorsize_}
	done
}

package() {
	cd "${srcdir}"/kde-workspace-${pkgver}/cursors/src

	# Directories
	install -d "${pkgdir}"/usr/share/icons/

	# Files
	for theme in ${_themelist_}; do
		cp -r --parents "oxy-${theme}${_cursorsize_}/cursors" "${pkgdir}"/usr/share/icons/
		cp "theme-${theme}/index.theme" "${pkgdir}"/usr/share/icons/oxy-${theme}${_cursorsize_}/
	done
}

sha1sums=('ec79a5d638a93b1abbb99b22a7bea52d9a2c26eb')
