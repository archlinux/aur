# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mame
pkgver=0.251.0.17
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mame"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mame')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mame/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('f459316c242b2b7934954c06896a1d6d0a208c1bc1c8c47fe56a118a8917515a32d433240678b30a3d6b502b593271acebf58fc3f8343eff864ef5af7f06cb17')

build() {
    cd "game.libretro.mame-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mame')
    cd "game.libretro.mame-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
