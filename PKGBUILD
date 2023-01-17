# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-hexen
pkgver=6.0.1
pkgrel=1
pkgdesc="A limit-removing source port of Hexen with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('hexen1-wad: Hexen demo game data')
conflicts=('inter-hexen-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/hexen-${pkgver}.tar.gz")
b2sums=('93cf7214b4531047eddfb5181b4a30c44121b1422a52466cb78b96f901a52ffc9c7ad2fe26552be11e6be2faf1bb25446b9ae5a80ce6324ab7230f9d9dd3c022')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom-hexen-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="OFF" \
    -D COMPILE_HERETIC="OFF" \
    -D COMPILE_HEXEN="ON" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="${pkgver}" \
    -D NO_GIT_HASH="ON"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
