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
_myrevision=8
pkgname=gtk-theme-united-archers-git
pkgver=v2.2.r8.g51e76e0
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
sha256sums=('feccdb6065725d24f5fa9457c78a6ea571e7d17630352437cef6b3ee971fd0b2' 'daefa082fb74062ff2d5a1a4093fa16dab4ca886235eb3ea5d6e3b41f43b34cf' '129e6af868f6e9c0416e7b63bb8287aa77bc2d6c93f26897c802375ff94c0cb0' '9be8b013d8c807473e289f90229edae7efac3852761ac7e97a23b4e95cb50771' '03c8ae4730fafc6175507b203094b510a258ded3d325142676932b5453c29e0a' '1ca77c3ae391708addb401994e0163191e2531d3981c279d721abf344a2d52fd')

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
