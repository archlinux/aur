#Maintainer: Doommsatic <keniscoolu@gmail.com>
pkgname=libretro-easyrpg-player
pkgver=0.6.2.3
pkgrel=3
pkgdesc="FLOSS RPG Maker 2000/2003 and EasyRPG games interpreter (libretro core)"
arch=('x86_64')
url="https://easyrpg.org/"
license=('GPL3')
depends=("liblcf>=${pkgver:0:5}" 'sdl2_mixer' 'pixman' 'freetype2' 'libvorbis' 'mpg123' 'libsndfile' 'speexdsp' 'wildmidi' 'libretro-core-info' )
makedepends=('git' 'cmake')
_commit=4dd00a6e1ec4b12174019f39624d268619bb3776
source=($pkgname::git+https://github.com/EasyRPG/Player.git#commit=${_commit})
sha256sums=(SKIP)

prepare(){
	cd $pkgname
	git submodule init
	git submodule update
	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPLAYER_TARGET_PLATFORM=libretro -DBUILD_SHARED_LIBS=ON
}

build(){
	cd $pkgname
	cmake --build .
}

package(){
	cd $pkgname
	install -Dm 644 easyrpg_libretro.so -t "$pkgdir"/usr/lib/libretro/
}
