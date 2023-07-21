# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-prboom
pkgver=2.5.0.44
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.prboom"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-prboom-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.prboom/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('c81e46e99e0b5a1e8984a085258e79e848b214d332f3e6ba0ade45f1fefae77f92050e368154a7d1183d4804eec1e7aed8b8dd6ec0f3e153a51440294d182e8c')

build() {
    cd "game.libretro.prboom-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-prboom')
    cd "game.libretro.prboom-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

