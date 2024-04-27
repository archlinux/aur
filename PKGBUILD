# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro
pkgver=20.2.7
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
sha512sums=('e5da3d055a97152ace6bc78d969c5a1dcc9917e85ef34181e7ecb9cdf2d9c669fae359b1b76320bb0ef2a6c83e2813d362de57cc3d7ed48fc553ad720c3fffac')

build() {
    cd "game.libretro-$pkgver-$_codename"
    cmake \
        -DCMAKE_POLICY_DEFAULT_CMP0135=NEW \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        -DENABLE_INTERNAL_LIBRETROCOMMON=1 \
        -DENABLE_INTERNAL_RCHEEVOS=1 \
        .
    make
}

package() {
    depends=('kodi' 'kodi-platform' 'libretro-core-info')
    cd "game.libretro-$pkgver-$_codename"
	make DESTDIR="$pkgdir/" install
}

