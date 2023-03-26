# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-2048
pkgver=1.0.0.134
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.2048"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-2048')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.2048/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('01a97ba563d0531c54d4faeebfd0a1218e0f8d6ac521608a96651f119fe1b4ef1b514f7de26059d9cb5916c0bceb91e5a4b26087a0e40bdd7bf932a06d616dec')

build() {
    cd "game.libretro.2048-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-2048')
    cd "game.libretro.2048-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

