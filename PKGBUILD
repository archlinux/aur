# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-stella
pkgver=3.9.3.39
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
sha512sums=('b3a64cec5c86eb21fdb21f851cf9a48c2041d0b6e74ae287a7b6089713cf71164914f1cc24b1c29e880667935a694045f8905cb6255fcbb827be2e14ca0072cf')

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

