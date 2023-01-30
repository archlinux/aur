# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-gambatte
pkgver=0.5.0.34
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.gambatte'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-gambatte')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.gambatte/archive/$pkgver-$_codename.tar.gz")
sha512sums=('f5e310ea8f8c32f970a9f1dc8953eb10d411a591f9b2f957e1d025dd090b146aadc3dae2a8b5eddf2528658207cf307d7f104bc884f66cd18f9395db4eb79595')

build() {
    cd "game.libretro.gambatte-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-gambatte')
    cd "game.libretro.gambatte-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

