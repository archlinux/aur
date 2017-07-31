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
_revision=3
pkgname=gtk-theme-united-archers-git
pkgver=v2.2.r1.gf1de93f
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
sha256sums=('b586fbde45c410e601c8a01a25b4b0104be5c141a0c7ce1b41904729eaff4a9a' '2dbcfafbf4aee5c7422a6dc9379ec79a7f90a06dbc00901fee82fe8f6ceace3e' '3cedd38ac81b1d5a25058f26d29dd894374b92f34ac475a9f2952b2f1d4ad357' '1b414a44739e7242bfdf7b326eebba75862cadf6af00d79e7a50a8ab9851d061' '2050291bce95ae3e0ce072a380f9a7e826272ebdb21b03873d48525b140e7f79' '06e7ceb9c0520fd27b4dfd69fe675afb9a47f1b666cbe3dd48e09d1ee3095113')

pkgver() {
	echo -n "v${_pkgver}.r${_revision}.g"; git ls-remote -q -h "${url}" master | cut -c1-7
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
