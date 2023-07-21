# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-atari800
pkgver=3.1.0.28
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.atari800"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-atari800-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.atari800/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('4ff46faa3a075cfb2e877c0d44c501434b234cd9cc010706e0a3dde3e0a1dab197dd9a1bead9e7b6219873a03415139feb7050deab25352fdaf2e45bbd7c7d94')

build() {
    cd "game.libretro.atari800-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-atari800-git')
    cd "game.libretro.atari800-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

