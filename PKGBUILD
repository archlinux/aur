# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-flycast
pkgver=0.1.0.39
_codename=Matrix
pkgrel=8
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.reicast'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-flycast')
options=(!lto debug)
replaces=('kodi-addon-game-libretro-reicast')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.reicast/archive/$pkgver-$_codename.tar.gz")
sha512sums=('0d3b478084cee78c5019284c11b0acb42bfd4134cf18034d43855182e48c9e1359668d5f459dabab68cf7941a98810c6a38734e0664442cbc52674b918ef571f')

build() {
    cd "game.libretro.flycast-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-flycast')
    cd "game.libretro.flycast-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

