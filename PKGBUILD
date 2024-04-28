# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Maintainer: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-mgba
pkgver=0.11.0.50
_codename=Nexus
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.mgba'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mgba')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mgba/archive/$pkgver-$_codename.tar.gz")
sha512sums=('e2c02834fc9dedeba1f9b66170bed8a83385b38d8ed3259e3863c3a0ca5fc14618b9ca097552ad67b9d3d1d2cd6467efb3e3eb91cb759d7b9563349ea8fe0833')

build() {
    cd "game.libretro.mgba-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-mgba')
    cd "game.libretro.mgba-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

