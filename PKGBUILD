# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom
pkgver=6.2
pkgrel=1
pkgdesc="A limit-removing source port of Doom with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('doom1-wad: Doom shareware game data')
conflicts=('inter-doom-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('2ea4bc99d73a8296ea530f57eff2c8783850a54ab9bcb36b23e4df17120f5241176fc1bc7e1c28e1710c8dc9c0bfcdaeef754e986f7e75531a64774f7002e161')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "${pkgname}-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="ON" \
    -D COMPILE_HERETIC="OFF" \
    -D COMPILE_HEXEN="OFF" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="${pkgver}"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
