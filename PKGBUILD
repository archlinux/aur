# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-2048
pkgver=1.0.0.132
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.2048"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-2048')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.2048/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('0e8e803043378732c75ed3603d298ff5b8087011f1e4102e7de186766b8eb8b70b89e509a59b52b1c5a597cfbae66bcf5e30a7c9b0a93ead6390dd4a4c87111e')

build() {
    cd "game.libretro.2048-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-2048')
    cd "game.libretro.2048-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

