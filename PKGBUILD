# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom
pkgver=6.1
pkgrel=1
pkgdesc="A limit-removing source port of Doom with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3 git)
optdepends=('doom1-wad: Doom shareware game data')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e96f9f9db4b49e070a1116a23b86391ebe231c85fb5b870d2c38d90ad18a05761212f287953b606f84f95d8d111c41af27ad17ff8e6860e5a834a51aa3c32a01')

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
