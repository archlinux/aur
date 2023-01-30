# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-mupen64plus-nx
epoch=1
pkgver=2.2.0.22
_codename=Matrix
pkgrel=8
pkgdesc="Nintendo 64 mupen64plus-next for kodi"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.mupen64plus'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mupen64plus-next')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mupen64plus/archive/$pkgver-$_codename.tar.gz")
sha512sums=('ff71c6c4e4b13ba90578de2cc5e04b50f94b8ed994c7d76c45476dc1dda4de3e1a148f83798290d8e3fb22a2eeeb06c854cb2e7198f544c93e7a4c860bf34e70')

build() {
    cd "game.libretro.mupen64plus-nx-$pkgver-$_codename"
    sed -e 's/mupen64plus_libretro/mupen64plus_next_libretro/g' \
        -i CMakeLists.txt
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mupen64plus-next')
    cd "game.libretro.mupen64plus-nx-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

