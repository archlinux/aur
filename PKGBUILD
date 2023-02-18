# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-fbneo
pkgver=1.0.0.62
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.fbneo"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-fbneo')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.fbneo/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('2901373dc4003a6625db51632431fd4278737180750f3731b0c1329f86a669075267a58bdfbbf1b6c2e27e5b86ec678d3d84faebc2554c5b8e93fae153562cc1')

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

