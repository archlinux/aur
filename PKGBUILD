# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-fbneo
pkgver=1.0.0.63
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.fbneo"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-fbneo')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.fbneo/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('93a819d37634d58bb4dea2bdd69fe4b63af09f97f2d9a7133c7353dd72d2a3cf2b63b04d506cea26b6493fc5dd71094cb87a12bef12839ef642fd71d45af9cd6')

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

