# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro
pkgver=20.1.0
_codename=Nexus
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'libretro-core-info' 'kodi-platform' 'kodi-dev')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro/archive/$pkgver-$_codename.tar.gz")
sha512sums=('df1ea78b978a753b8698e808cd241fafc34d731e38d4f165b713e2bb836e9b1353ea6d8506e2f4915116e5e430286903615faa7eb6c3526f163e7cba88cedabf')

build() {
    cd "game.libretro-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi' 'kodi-platform' 'libretro-core-info')
    cd "game.libretro-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

