# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-fbneo
pkgver=1.0.0.64
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
sha512sums=('c543b1719d5c5a12614a6b107e661ab0f747b98a3c03a5a69360e01865a836c24c479761fd4fdf1946d6c4ad40a983ab582d1413bb43ef5e7437a37699230b53')

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

