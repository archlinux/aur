# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mame
pkgver=0.261.0.24
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mame"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mame')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mame/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('c8fa7ee5a919c8228ea9243f0fbf70a20995fbfe489a6ea9f48be8d09cd52042565648122d1973676ca11cac13affa5a6f4b7146b0ebe7f40683dca57700aa6f')

build() {
    cd "game.libretro.mame-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mame')
    cd "game.libretro.mame-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
