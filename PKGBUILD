# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-mrboom
pkgver=5.2.0.145
_codename=Matrix
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.mrboom"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mrboom')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mrboom/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('41e1c119b3fff46e330c8f02f303abb8a09ef7ae1fa966a050cbca6f569b16eaff9c05a7ea52e65d922e6a5674245d748d9ea6c64d8e4fcc1af1ab2154c7f377')

build() {
    cd "game.libretro.mrboom-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mrboom')
    cd "game.libretro.mrboom-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

