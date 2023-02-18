# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-prboom
pkgver=2.5.0.35
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.prboom"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-prboom-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.prboom/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('54aabdd3184f06c9190c7c14ce9d7f7a91c48dd037943de40c41b9a15a5f50c3cd32c34df803314ec2031f29ca84628e22167eed25090d848b963fb9bfc6096d')

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

