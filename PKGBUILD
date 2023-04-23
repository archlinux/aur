# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-stella
pkgver=7.0.0.41
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.stella"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-stella2014')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.stella/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('2f486ddf993bfd351d729a0ead2922fa15390d707f44ed4d705a1ed7afa55fdc29fd6edf045b2632dc3cc8dc1abb2514bc76d685af45f21c88442e98321f19ce')

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

