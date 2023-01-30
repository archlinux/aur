# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-desmume
pkgver=0.0.1.21
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.desmume'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-desmume')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.desmume/archive/$pkgver-$_codename.tar.gz")
sha512sums=('f6cec900358235aba9f9b31a693ae869c314e101764ab8efac1ac350ddcc13a7b1a3e78549e6181cb568d56b75c2068b1569cff005b6bec26b76f2977513ca97')

build() {
    cd "game.libretro.desmume-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-desmume')
    cd "game.libretro.desmume-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

