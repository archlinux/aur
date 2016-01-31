# Maintainer: Nascher <kevin at nascher dot org>
# Contributor: Menche <menche_mt at yahoo dot com>

pkgname=voxelands-next-git
pkgver=v1508.01.r265.gf4f0556
pkgrel=2
pkgdesc="A fork of Minetest, an Infiniminer/Minecraft inspired game (experimental branch)"
url="http://www.voxelands.com"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxxf86vm' 'irrlicht' 'sqlite' 'libvorbis' 'openal' 'glu' 'libsm' 'hicolor-icon-theme' 'freetype2')
makedepends=('git' 'cmake' 'gettext')
replaces=('minetest-classic-next-git')
provides=('minetest-classic' 'voxelands')
conflicts=('minetest-classic' 'minetest-classic-next-git' 'voxelands')
source=(${pkgname}::git+https://gitlab.com/voxelands/voxelands.git#branch=next)
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_FLAGS_RELEASE=-DNDEBUG -DCMAKE_CXX_FLAGS_RELEASE=-DNDEBUG
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

