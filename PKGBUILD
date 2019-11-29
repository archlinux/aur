# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-game-libretro-genplus
pkgver=1.7.4.7
_codename=Leia
pkgrel=1
pkgdesc="Genesis Plus GX Libretro wrapper for Kodi's Game API"
arch=('x86_64')
url='https://github.com/kodi-game/game.libretro.genplus'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
depends=('kodi-addon-game-libretro' 'libretro-genesis-plus-gx')
makedepends=('cmake' 'kodi-dev')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.genplus/archive/$pkgver-$_codename.tar.gz")
sha512sums=('39617c5221b54537e8229d0f7f07791bb4a76c3fb3c578cbf0fcf669d8296304aded81cecb76ac5eaac64a77c7c7e67eae4c83cf9328278ec1edfb88a9e440d5')

build() {
    cd "game.libretro.genplus-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    cd "game.libretro.genplus-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

