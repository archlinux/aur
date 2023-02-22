# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-tyrquake
pkgver=0.62.0.35
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
sha512sums=('f0910a375446226b14b1f3bfa6960a9c35815c8ff3c8f4393faa270a76a575fa03d2631a0c15b99bb2a2c06a90f3cbeeb66ef9758d14fb55e0784e12a14febf3')

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

