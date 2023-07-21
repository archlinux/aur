# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mrboom
pkgver=5.2.0.151
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
sha512sums=('73fe7fd1af32a4a338f3c819628ce30becb646554fe65df8defb94d94738ca8c7c4c5498a9337f56befe551d33c18c65fa6bb084bafe4a6641a13a95a9043fc2')

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

