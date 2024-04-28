# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-prboom
pkgver=2.5.0.48
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('aarch64' 'armv7h')
url="https://github.com/kodi-game/game.libretro.prboom"
license=('GPL2')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-prboom-git')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.prboom/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('49042398c38b9f6c3f7f3229af1da5ea117843ddb06355ca8a55362437a62904cdc1f0dd1c4a88464dd9e7f5a1cfd01c0858eaf06bcd2fe67b094ee132cd6b52')

build() {
    cd "game.libretro.prboom-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-prboom')
    cd "game.libretro.prboom-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}

