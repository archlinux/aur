# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-stella
pkgver=3.9.3.38
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
sha512sums=('af49f2a1abac6101c7f70da150e653a8a72ed8901939f22b20c8f967bb0f8e3aff5edaef18ee435638af81a6a8488d5375a145e4af3fa098cf297d660f709514')

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

