# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-2048
pkgver=1.0.0.140
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.2048"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-2048')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.2048/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('0b8f5d9e4eab7a6a7c938860ab251ed682ecdbf42b4f361b53dbe30dd720090b1ded31306ac796de1f0c50e1344da6453ae0523e3914b076bf74dcdb67d85dc7')

build() {
    cd "game.libretro.2048-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-2048')
    cd "game.libretro.2048-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

