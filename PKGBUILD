# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Konsta Kokkinen <kray@tsundere.fi>

pkgname=minetest-git-leveldb
_pkgname=minetest
pkgver=20150114.e19dab2
pkgrel=1
pkgdesc='Infiniminer/Minecraft-inspired building game (with LuaJIT, LevelDB, and Redis support)'
url='http://www.minetest.net/'
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
depends=('bzip2' 'libpng' 'libjpeg' 'mesa' 'sqlite' 'openal' 'libvorbis' 'irrlicht' 'curl' 'freetype2' 'luajit' 'leveldb' 'gettext' 'hiredis')
source=('git://github.com/minetest/'minetest{,_game}.git)
sha1sums=('SKIP' 'SKIP')

conflicts=("${_pkgname}")
provides=("${_pkgname}")
install=install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}"
	rm -fr minetest/games/minetest_game
	mkdir -p minetest/games/minetest_game
	cp -a minetest_game/* minetest/games/minetest_game
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_FREETYPE=on -DENABLE_LEVELDB=on -DENABLE_CURL=on -DENABLE_GETTEXT=on -DENABLE_REDIS=on
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
