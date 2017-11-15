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
_myrevision=10
pkgname=gtk-theme-united-archers-git
pkgver=v2.2.r10.gbfb20eb
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
sha256sums=('abd33c8a678192b96efdf0fc8b9f4de99482ccf96196a362b408afad49f3db09' 'dec74254e9dd2a9dfe82fa7a0957f8300171ee5a830aaa027711c81072a0ffc3' '67847ad1bcda31358bb0dbfc981469110f57eff9c26976751eba19e78f14ba82' '8eae4377a1feb589030f6bd33bbd7a3e41494e7ee0f61fd97ffeef0c6674cfb1' '57e5cffae9f54434b3ff6fb2f5a78f716992126dd5fd4ba1b429211f7875a8a8' '2d8e44157b6ae178ccd27c290ebe2e0b0715acac0616b18101842f88e24c1e4b')

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
