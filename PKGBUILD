# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-atari800
pkgver=3.1.0.23
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
sha512sums=('57024ba32f2816f5c8cc672a2eb085fcc289df17d609dd3e88671d9e7c0d1867b77edea74e23b95e080f3c8e9da76b25a554c3f9c1ee8d4775eb2c00c9fa1662')

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

