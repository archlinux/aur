# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Maintainer: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-mgba
pkgver=0.11.0.41
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
sha512sums=('89d00927d048f3910d2280ab1f93d1000e40839d55e5184464fdc36db0f9d74b568eaa62291ea0d74aca636d69f619973a08e71c6600841da2c42b5414987668')

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

