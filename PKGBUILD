# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-atari800
pkgver=3.1.0.33
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
sha512sums=('61edd6a8e47223496c661e6df88fccc1a1db4c9a59d4af43eaed59f76092d69084a095a7615a487a60e7d10987bfaafb78df8b3d0fa3a859f1452c3d6b6d1cba')

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

