# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-addon-game-libretro-prboom
pkgver=2.5.0.38
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
sha512sums=('7e6e66009dfad2816529c3b879fe42505c62af18a8114c2af99fa72862b36b57946b00490bc36e4e53e14655e1f5ccfadec3cfcaa28a93ff4a6e805095811bcd')

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

