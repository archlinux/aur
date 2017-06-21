# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgname=minetest-git
_pkgname=minetest
pkgver=20170621.1425c6def
pkgrel=1
pkgdesc='Infiniminer/Minecraft inspired game'
url='http://www.minetest.net/'
license=('LGPL2.1' 'CCPL:by-sa')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('bzip2' 'libpng' 'libjpeg' 'mesa' 'sqlite' 'openal' 'libvorbis' 'irrlicht' 'freetype2')
source=('git://github.com/minetest/'minetest{,_game}.git)
sha256sums=('SKIP' 'SKIP')

conflicts=("${_pkgname}"{,-common,-server})
provides=("${_pkgname}"{,-common,-server})
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"
	cp -a minetest_game minetest/games
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_GETTEXT=TRUE \
		-DRUN_IN_PLACE=FALSE
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
