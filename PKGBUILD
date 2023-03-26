# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-fbneo
pkgver=1.0.0.66
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.fbneo"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-fbneo')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.fbneo/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('48cfe573a4b643265c6d2152fc58a142d43357b70da87decabec211c541074759d42a2dfdb1b6473a98ea60367bdc6c12443a5601af517448e52cd4b959fc128')

build() {
    cd "game.libretro.fbneo-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-fbneo')
    cd "game.libretro.fbneo-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

