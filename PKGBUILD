# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-scummvm
pkgver=2.6.1.30
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.scummvm'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-scummvm')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.scummvm/archive/$pkgver-$_codename.tar.gz")
sha512sums=('88cb09ad224b36fcc18e58555ecaa05c8be3bf2eff168ea49cfbcdf7755c5b5e7aaf94d59c66ccc14326f2f48b5770b32b14a482a65a3ba244e26a18000ae028')

build() {
    cd "game.libretro.scummvm-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-scummvm')
    cd "game.libretro.scummvm-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

