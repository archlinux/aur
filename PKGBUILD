# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-2048
pkgver=1.0.0.137
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.2048"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-2048')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.2048/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('36bdac2433e8237b45b6c63b1e247ae6be4758c9469ae9226f7ada1320b501e98b7578963bf45c78b553cdd185ced3e8fa5ee2ed321d71765472fba38b56224e')

build() {
    cd "game.libretro.2048-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-2048')
    cd "game.libretro.2048-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

