# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Maintainer: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-mgba
pkgver=0.10.0.37
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.mgba'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-mgba')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.mgba/archive/$pkgver-$_codename.tar.gz")
sha512sums=('202a75b2cf7f5d357681075b0899c246c460231a8f6a4a1301aa28e6774402803f5c02b679ce16d22f0b65af0bd1a8fa348b274e22b367ce1db2116e2caed1ae')

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

