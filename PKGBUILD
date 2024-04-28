# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-gambatte
pkgver=0.5.0.52
_codename=Nexus
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.gambatte'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-gambatte')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.gambatte/archive/$pkgver-$_codename.tar.gz")
sha512sums=('9c28f3011894a74f78c151dd3aab6623f0d9f5d196de026f6e49774a627eab613e277cf2c5c0917090ee314c86759c906009688a4392a0ae867ee95c007567e6')

build() {
    cd "game.libretro.gambatte-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-gambatte')
    cd "game.libretro.gambatte-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

