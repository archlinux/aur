# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mame
pkgver=0.251.0.23
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mame"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mame')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mame/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('9c5dfa2f527ca24b4e37ab56750258052415e747cfc5c4d92e6ce0daabee580bc501eb1fbabdb43a8538afebec00e02a1d129e50cabf4ac333209da0431b572a')

build() {
    cd "game.libretro.mame-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mame')
    cd "game.libretro.mame-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
