# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-atari800
pkgver=3.1.0.22
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.atari800"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-atari800-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.atari800/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('fd15752183d80398bc42aa75df12a6ccba7663eb326634250fafa5c5c009da16581a8aec36e3e42e02565cdeea43c4f43ac3cd212ba481ca37ec1414e2cbf9a4')

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

