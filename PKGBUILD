# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-stella
pkgver=7.0.0.44
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
sha512sums=('757ff2b4601312136ea58ebdaeba6b8b1d3217d020d74d08a8a648a4db47d924b740ad774cd3b6de8ef3e3f97e40f99369977b2f9571192eca2d297849f9008b')

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

