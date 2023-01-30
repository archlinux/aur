# Maintainer: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-game-libretro-beetle-psx
pkgver=0.9.44.43
_codename=Matrix
pkgrel=1
pkgdesc="Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.beetle-psx'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-beetle-psx')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.beetle-psx/archive/$pkgver-$_codename.tar.gz")
sha512sums=('7a940906e5ef26f549ec22e747542866d2f981b9c7ebc868a76625ba1990a5e7d213ff10691c856df024c4947ae271622cf9541c658c23ec4b5ec3267b9cb8ec')

build() {
    cd "game.libretro.beetle-psx-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-beetle-psx')
    cd "game.libretro.beetle-psx-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

