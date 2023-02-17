# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-stella
pkgver=3.9.3.35
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.stella"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-stella2014')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.stella/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('4f4cc26bda2b1235727b8b1a1ddfe7758e83823650751c597840c2e769463249788ed04a3088078ff98f00824dbf79af7f2f980a2ba5d8781a1b02f874dac6a8')

build() {
    cd "game.libretro.stella-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-stella2014')
    cd "game.libretro.stella-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

