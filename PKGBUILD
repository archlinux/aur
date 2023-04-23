# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>>

pkgname=kodi-addon-game-libretro-nestopia
pkgver=1.52.0.38
_codename=Nexus
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.nestopia'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-nestopia')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.nestopia/archive/$pkgver-$_codename.tar.gz")
sha512sums=('3a05f119418228fa2357b2a54e9cdf339c135e5f6aca41c012d657922ab0e718fc81af39a1bba0da32cf34a8d4e98b944e806d3477309779367689623b100f2e')

build() {
    cd "game.libretro.nestopia-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-nestopia')
    cd "game.libretro.nestopia-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

