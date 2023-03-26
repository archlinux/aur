# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mrboom
pkgver=5.2.0.148
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mrboom"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mrboom')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mrboom/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('4abeb26fd008a3ea1b0b343befdc6a8f08c2b9a4098c626abddca89a5c8d99947dd397ac43eb953b38a0843090ebeddaddeca3c446e2672b40f7c98b318b46e2')

build() {
    cd "game.libretro.mrboom-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mrboom')
    cd "game.libretro.mrboom-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

