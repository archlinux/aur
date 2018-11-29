# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor:  Nascher <kevin at nascher dot org>
# Contributor:  Menche <menche_mt at yahoo dot com>

# For the src directory
_pkgcommit=bd31b6d6d0808aa64b6985da99d3d1f7b414b17d

pkgname=voxelands
pkgver=1709.00
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game"
url="http://voxelands.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal'
         'glu' 'libsm' 'hicolor-icon-theme' 'freetype2')
makedepends=('cmake' 'gettext')
replaces=('minetest-classic')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands-next-git')
install="${pkgname}.install"
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/${pkgname}/${pkgname}/repository/v${pkgver}/archive.tar.bz2)

sha256sums=('a5d79af8c7934c0e3419d9e59c0812bb7c7ecc6fe654f3d0c132f721e9afee3b')

build() {
	cd "$srcdir/${pkgname}-${_pkgver}-${_pkgcommit}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "$srcdir/${pkgname}-${_pkgver}-${_pkgcommit}"
	make DESTDIR="${pkgdir}" install
}
