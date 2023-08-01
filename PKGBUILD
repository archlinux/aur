# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>
# Contributor: BlackEagle <ike DOT devolder AT gmail DOT com>

pkgname=kodi-addon-game-libretro
pkgver=20.2.4
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
sha512sums=('e0e62971444cfa972bf7ac0550822d97455aa46565eae146dc8999afbb5aa787d3d8bc829182d5ed4f21e6945a7a18caaca91cdbdf101abdb3294485a0406c71')

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

