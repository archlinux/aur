# Maintainer:   Nascher <kevin at nascher dot org>
# Contributor:  Menche <menche_mt at yahoo dot com>

# For the src directory
_pkgcommit=9044445c440209ec7536931258754ae8351ea084

pkgname=voxelands
pkgver=1704.00
pkgrel=1
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
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/${pkgname}/${pkgname}/repository/archive.tar.gz?ref=${pkgver})

sha256sums=('3994462c3d80e04a5475a4b1f52b317693b9700894f28b91393248899241e4c1')

build() {
	cd "$srcdir/${pkgname}-${pkgver}-${_pkgcommit}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}-${_pkgcommit}"
	make DESTDIR="${pkgdir}" install
}
