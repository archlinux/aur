# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor:  Nascher <kevin at nascher dot org>
# Contributor:  Menche <menche_mt at yahoo dot com>

# For the src directory
_pkgcommit=bd31b6d6d0808aa64b6985da99d3d1f7b414b17d

pkgname=voxelands
pkgver=1709.00
_pkgver="v${pkgver}"
pkgrel=3
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
url="https://gitlab.com/voxelands/voxelands"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal'
         'glu' 'libsm' 'hicolor-icon-theme' 'freetype2')
makedepends=('cmake' 'gettext')
replaces=('minetest-classic')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands-next-git')
install="${pkgname}.install"
source=("https://gitlab.com/voxelands/voxelands/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('0fe8da057b13257aa8df8cc4ed4a13e40dc39894d18df65d870702c751972eda')

build() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	make DESTDIR="${pkgdir}" install
}
