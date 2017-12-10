# Maintainer: Yiannis A Ginis <drxspace[at]gmail[dot]com>

_gitname=United-GNOME
_pkgnames=('United-Antergos-Compact'
	'United-Antergos'
	'United-Arch-Compact'
	'United-Arch'
	'United-Manjaro-Compact'
	'United-Manjaro'
)
_pkgver=2.2
_myrevision=11
pkgname=gtk-theme-united-archers-git
pkgver=v2.2.r11.gdf35f2c
pkgrel=1
pkgdesc='GTK2/3 + GNOME Shell theme based on a Ubuntu 18.04 design concept.'
arch=('any')
url="https://github.com/godlyranchdressing/${_gitname}"
license=('GPL3')
provides=("${_gitname}=${pkgver}")
depends=('git'
	'gtk3>=3.20'
	'gnome-themes-standard'
	'gdk-pixbuf2'
	'gtk-engines'
	'gtk-engine-murrine')
optdepends=('gnome-shell>=3.22: The GNOME Shell'
	'gnome-tweak-tool: A graphical tool to tweak gnome settings')
source=("${_pkgnames[0]}.tar.gz::${url}/blob/master/${_pkgnames[0]}.tar.gz?raw=true"
	"${_pkgnames[1]}.tar.gz::${url}/blob/master/${_pkgnames[1]}.tar.gz?raw=true"
	"${_pkgnames[2]}.tar.gz::${url}/blob/master/${_pkgnames[2]}.tar.gz?raw=true"
	"${_pkgnames[3]}.tar.gz::${url}/blob/master/${_pkgnames[3]}.tar.gz?raw=true"
	"${_pkgnames[4]}.tar.gz::${url}/blob/master/${_pkgnames[4]}.tar.gz?raw=true"
	"${_pkgnames[5]}.tar.gz::${url}/blob/master/${_pkgnames[5]}.tar.gz?raw=true"
)
sha256sums=('626809376c8331f7a7e761540e713beadab3f46cda72103431a42739a1bbdc12' '1506d7fd4cc5055d45d1392714c0ce24ed4816cfa027224ffb75359f7a528d26' '7d5e57346965dd196107054cd9d61c9754e42acc13fb105cf723e39839023721' 'a381f3c9e91d7b91403068a78462c4ce700bdedd7a2732e26bb95593fc82060b' '3216c7fef1acf776fa92b6063913e8c0b4aaa531043812369f049e3b03f21e22' '5eca63bc00173d47e83abd7e9d573dfe279f960dd7ced734edd9a9094652182c')

pkgver() {
	echo -n "v${_pkgver}.r${_myrevision}.g"; git ls-remote -q -h "${url}" master | cut -c1-7
}

prepare() {
	download_sources
	check_source_integrity
	extract_sources
}

package() {
	cd "${srcdir}"
	find */ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/themes/{}" \;

	find ${pkgdir}/usr/ -type f -exec chmod 644 {} \;
	find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;
} 
