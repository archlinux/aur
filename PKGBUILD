# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-tyrquake
pkgver=0.62.0.44
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
sha512sums=('089e227b014c0c28aa0030adefba802fa5f011531f4b65dd3bfd200c980b9a93a003ed5a5247df5d3a5f663ad4767e051223f5ca78a107992c319afb22efbbf6')

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

