# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mame
pkgver=0.251.0.16
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
sha512sums=('835aca41cfd556eadedea1fd650ac437782cdad4f24569e631b86cd0f5c2e0fefffe07a4daff898924e73f5372e03ae910b822d38259dd4ad34698024051bc21')

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
