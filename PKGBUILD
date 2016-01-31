# Maintainer: ssf <punx69 at gmx dot net>

pkgbase=ivy-theme-git
pkgname=('ivy-icon-theme')
pkgver=2016.01.31.2003
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
	cd "${pkgbase}"
	bash build.sh
	_dirs="src .git"
	for _dir in $_dirs;do
		if [ -d $_dir ];then
			rm -rf $_dir
		fi
	done
	_files="build.sh README.md .sync.sh .synch-full.sh"
	for _file in $_files;do
		if [ -f $_file ];then
			rm -f $_file
		fi
	done
}

package_ivy-icon-theme() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<=${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<=${pkgver}")
	depends=('hicolor-icon-theme' 'tango-icon-theme')
	pkgdesc="simple and colorful icon theme for X11 desktops!"
	cd "${srcdir}"/"${pkgbase}"
	mkdir -p "${pkgdir}"/usr/share/icons
	cp -R "${srcdir}"/"${pkgbase}" "${pkgdir}"/usr/share/icons/Ivy
}
