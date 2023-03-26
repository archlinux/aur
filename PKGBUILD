# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-atari800
pkgver=3.1.0.25
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.atari800"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-atari800-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.atari800/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('fd9e73e76acd387a5082837641d0304e89de641cb3ba9d0baf96174f6338aa06e37e714baee5b288ce92788aa2f30b6312f59ab4d90f2f00c7557c9ea14fc0b9')

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

