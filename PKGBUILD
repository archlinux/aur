# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=6.1
pkgrel=1
pkgdesc="A limit-removing source port of Heretic with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('heretic1-wad: Heretic shareware game data')
conflicts=('inter-heretic-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/heretic-${pkgver}.tar.gz")
b2sums=('5f0b71964a8272896e59c147cf9ac8dce3571a9623dfebed49c09c0ee7c43253e2aed81acddbf2eb246404aa3bafdb16d336f70147a8ef70792bd25785defff0')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom-heretic-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="OFF" \
    -D COMPILE_HERETIC="ON" \
    -D COMPILE_HEXEN="OFF" \
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
