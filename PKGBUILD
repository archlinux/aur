# Maintainer:   Nascher <kevin at nascher dot org>
# Contributor:  Menche <menche_mt at yahoo dot com>

# For the src directory
_pkgcommit=3ac3f431a26858857f6805ad33f5fe8aaa8d0765

pkgname=voxelands
pkgver=1608.01
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
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/${pkgname}/${pkgname}/repository/archive.tar.gz?ref=v${pkgver})

sha256sums=('e42a803f8e6bc5effa9ce9356e8415de026ea9ed7c7c187e9df40051cc345a44')

build() {
	cd "$srcdir/${pkgname}-v${pkgver}-${_pkgcommit}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG	
	make
}

package() {
	cd "$srcdir/${pkgname}-v${pkgver}-${_pkgcommit}"
	make DESTDIR="${pkgdir}" install
}
