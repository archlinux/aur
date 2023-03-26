# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>>

pkgname=kodi-addon-game-libretro-nestopia
pkgver=1.52.0.37
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
sha512sums=('a568005583d1349b9d619382c88558693da4ac4bc933ca10dda1fb716dd7a4ce97ca76b5b9052d2068700857e2d201efc8de74fca1cc71f4a259216c8a3ef231')

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

