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
_myrevision=3
pkgname=gtk-theme-united-archers-git
pkgver=v2.2.r3.g3dbd124
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
sha256sums=('80f6c9745c5b5223883ed32f63eb19f175d8871928af04129a43ae8d141692c1' '1ecbfa6ff5d21e0ce19d93dba8331827f69531872b2e2db9b89ce3b64c7946de' '6960ad8378e8897d759c23f50c3cf5df8899ed6ed22bccf4b8b4b665112e8c71' '35de4983b1c81179f9f9c75141b29c7fff31d9b023732268b66bc4a945d639e1' '98c72617eac44884b989fb04ac09b4cb7f1d6e4276d473ac28ff2913d202fe65' '175e68f230541b4e17fcf3d39f0cefa129f54baca774a5199b40c911bb6d3e33')

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
