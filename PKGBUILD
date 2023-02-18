# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-tyrquake
pkgver=0.62.0.32
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.tyrquake"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-tyrquake')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.tyrquake/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('899b19b90c8d4daab4858afbe9e6a084d60beaab200cf2bb2b79007ba855d3464bc951645571bda6672966608a3a6638c821a0f14671ad7009d2c148333559ca')

build() {
    cd "game.libretro.tyrquake-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-tyrquake')
    cd "game.libretro.tyrquake-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

