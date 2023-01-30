# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-parallel-n64
pkgver=2.0.0.26
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.parallel_n64'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-parallel-n64')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.parallel_n64/archive/$pkgver-$_codename.tar.gz")
sha512sums=('c88220a5c8fd113d222527c8b214fd963793c1b80fce53e9594f2f20318b070f9970e5549a311a19d5399bb9fd0e63a50967d8a6d72b86b2b1ab452ef4d22c5e')

build() {
    cd "game.libretro.parallel_n64-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-parallel-n64')
    cd "game.libretro.parallel_n64-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

