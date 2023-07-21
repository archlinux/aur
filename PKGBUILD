# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-fbneo
pkgver=1.0.0.71
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.fbneo"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-fbneo')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.fbneo/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('aff721d7d062f1e58c21340d0c2f3500ccd0c45350179b36c14e6015a04386899517908eddceaea80087372d11600e8f7af92c7ae198a0a77acb190e443ec4b6')

build() {
    cd "game.libretro.fbneo-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-fbneo')
    cd "game.libretro.fbneo-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

