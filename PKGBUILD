# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mrboom
pkgver=5.3.0.157
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
sha512sums=('9edb36c278ba347e615a29a21a0384e43537b3df7e6fe2dc574dbd7ffc7d4d4199d0b03854dee79983b57d767ff390396044792bbcca57a2a6917b779e25d523')

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

