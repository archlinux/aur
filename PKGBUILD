# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>>

pkgname=kodi-addon-game-libretro-nestopia
pkgver=1.52.0.41
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
sha512sums=('86b893f699285c7c7e881f31af98109cd7045d03f93a93621d28f969cfae0c22bdc8e431d48a9313755880d8bf27912d8eb872cbd81041fa701aad83f0da7383')

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

