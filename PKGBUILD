# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-prboom
pkgver=2.5.0.40
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
sha512sums=('10f24ac3a87b9f903f70854dfa57de8a08af67e7e415709bd2ac5ee7341b9fc18f06f40f5376cfe2c03b5fcd10ca159e35104b1fa6363ed2ae73737d7c4ac6ab')

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

