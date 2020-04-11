# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_pkgbase_=oxygen
pkgname=${_pkgbase_}-cursors-extra
pkgver=5.18.4.1
_dirver_=5.18.4
pkgrel=1
pkgdesc="KDE's Oxygen mouse cursor theme - the extra flavours"
url="https://projects.kde.org/projects/kde/workspace/oxygen"
arch=("any")
license=("LGPL")
makedepends=('cmake' 'inkscape' 'xorg-xcursorgen')
optdepends=("oxygen: contains the default Oxygen cursor colours")
options=(!emptydirs)
#source=("http://download.kde.org/stable/plasma/${pkgver}/${_pkgbase_}-${pkgver}.tar.xz")
source=("http://mirror.internode.on.net/pub/kde/stable/plasma/${_dirver_}/${_pkgbase_}-${pkgver}.tar.xz")

# Cursor size
_cursorsize_=""
#_cursorsize_="-big"

# Theme list
_themelist_="bluecurve brown cherry chrome desert emerald green grey honeycomb hot_orange lilac midnight_meadow navy norway obsidian obsidian-hc olympus olympus-inv orchid oxygen peach purple red red-argentina sea_blue steel terra terra_green violet viorange whitewater wonton"
#_themelist_="${_themelist_} black blue white yellow zion"

build() {
	cd "${srcdir}"/${_pkgbase_}-${pkgver}/cursors/src

	cmake .

	for theme in ${_themelist_}; do
		make theme-${theme}${_cursorsize_}
	done
}

package() {
	cd "${srcdir}"/${_pkgbase_}-${pkgver}/cursors/src

	# Directories
	install -d "${pkgdir}"/usr/share/icons/

	# Files
	for theme in ${_themelist_}; do
		cp -r --parents "oxy-${theme}${_cursorsize_}/cursors" "${pkgdir}"/usr/share/icons/
		cp "theme-${theme}/index.theme" "${pkgdir}"/usr/share/icons/oxy-${theme}${_cursorsize_}/
	done
}

sha1sums=('ebf30a5189d4c9f355515779989094471d1fa512')
