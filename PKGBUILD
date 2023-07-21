# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-tyrquake
pkgver=0.62.0.40
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.tyrquake"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-tyrquake')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.tyrquake/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('c17aa25fa0fa64d31da98e595d76deba015079cc45a4b0a5e28cda8a10308ebf14cf03cab08ff4e91c7af5f256b637a7f6fb43115e4eb9e06b89b3d486c9b591')

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

