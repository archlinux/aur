# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-snes9x
pkgver=1.61.0.41
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.snes9x'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-snes9x')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.snes9x/archive/$pkgver-$_codename.tar.gz")
sha512sums=('64795c5394ff024eb03cb873943743a6f83484753d431839653c24ff9bb7e85486b852ed5d965b9cb4ee8833953d9d0d9629414ad984a401402c077069273356')

build() {
    cd "game.libretro.snes9x-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-snes9x')
    cd "game.libretro.snes9x-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

