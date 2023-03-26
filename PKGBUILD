# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-tyrquake
pkgver=0.62.0.37
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.tyrquake"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-tyrquake')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.tyrquake/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('f07815ace8909f3abb4b2a0517c5f5dd4b61b9244da7af10cc362f66ca9422767cd0552cee6fcb117306a588db6b2a61e3c44109bcc3c9f83c995df868aa2a50')

build() {
    cd "game.libretro.tyrquake-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-tyrquake')
    cd "game.libretro.tyrquake-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

