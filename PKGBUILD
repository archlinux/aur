# Maintainer: ssf <punx69 at gmx dot net>
# https://github.com/sixsixfive/Ivy/blob/master/dist/AUR/ivy-theme-git/PKGBUILD

pkgbase=ivy-theme-git
pkgname=('ivy-icon-theme' 'ivy-theme-base')
pkgver=2016.02.24.1717
pkgrel=1
arch=("any")
url="http://sixsixfive.deviantart.com/art/Ivy-112213849"
license=("CCPL:cc-by-sa-4.0")
makedepends=('git' 'optipng' 'inkscape' 'parallel' 'findutils' 'sed' 'gawk' 'imagemagick' 'gtk-update-icon-cache')
source=(${pkgbase}::git://github.com/sixsixfive/Ivy)
md5sums=('SKIP')
# don't pack this so heavily since pacman is the slowest pkgmgr around...
PKGEXT='.pkg.tar'
 
pkgver() {
	printf "$(date -u +%Y.%m.%d.%H%M)"
}

build() {
	cd "${pkgbase}"/icons
	bash build.sh
	_dirs="src .git dist"
	for _dir in $_dirs;do
		if [ -d $_dir ];then
			rm -rf $_dir
		fi
	done
	_files="build.sh README.md TODO .sync.sh .synch-full.sh"
	for _file in $_files;do
		if [ -f $_file ];then
			rm -f $_file
		fi
	done
}

package_ivy-icon-theme() {
	pkgname=("${pkgname}")
	provides=("${pkgname}=${pkgver}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	depends=('hicolor-icon-theme')
	pkgdesc="Simple and icon theme for X11 desktops!"
	mkdir -p "${pkgdir}"/usr/share/icons
	mv "${srcdir}"/"${pkgbase}"/icons/Ivy "${pkgdir}"/usr/share/icons
}

package_ivy-theme-base() {
	pkgname=("${pkgname}")
	provides=("${pkgname}=${pkgver}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}<=${pkgver}" "${pkgname}-git<=${pkgver}")
	depends=('gtk2' 'gtk-engine-murrine')
	pkgdesc="Simple theme for X11 desktops!"
	mkdir -p "${pkgdir}"/usr/share/themes
	mv "${srcdir}"/"${pkgbase}"/gui-base/Ivy "${pkgdir}"/usr/share/themes
}
