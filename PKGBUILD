# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro-snes9x
pkgver=1.62.3.50
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides a wrapper that allows Libretro cores to be loaded as game add-ons"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/kodi-game/game.libretro.snes9x'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-game')
makedepends=('cmake' 'kodi-dev' 'kodi-addon-game-libretro' 'libretro-snes9x')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-game/game.libretro.snes9x/archive/$pkgver-$_codename.tar.gz")
sha512sums=('2d65691ee0a351b5b236ea28eec90ceb6658a95f77afede2ec1b2263e91213a7d603f23e0e56929556236a4960d720eaad48fc1da7dc075b764ac645ed0f9d4e')

build() {
    cd "game.libretro.snes9x-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-addon-game-libretro' 'libretro-snes9x')
    cd "game.libretro.snes9x-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

