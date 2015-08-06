# Maintainer: Nascher <kevin at nascher dot org>
# Contributor: Menche <menche_mt at yahoo dot com>

pkgname=voxelands-next-git
pkgver=20150727.e95d4a4
pkgrel=1
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game (experimental branch)"
url="http://www.voxelands.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal' 'glu' 'libsm' 'hicolor-icon-theme' 'freetype2')
makedepends=('git' 'cmake' 'gettext')
replaces=('minetest-classic-next-git')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands')

source=('git+https://gitlab.com/voxelands/voxelands.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/voxelands"
	git log -1 --date=short --format="%cd.%h" | tr -d -
}

build() {
	cd "${srcdir}/voxelands"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG
	make
}

package() {
	cd "${srcdir}/voxelands"
	make DESTDIR="${pkgdir}" install
}

