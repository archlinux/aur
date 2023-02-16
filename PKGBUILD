# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mame
pkgver=0.251.0.14
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mame"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mame')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mame/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('97dc50bb2d6f32daa5c148d7e680cbb26fced3ba5cbd956f69439026c9f6da344ce5444c082de8bd4c0a506863c000e291c8a6e8127c668bbeaca02a230fb9eb')

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
