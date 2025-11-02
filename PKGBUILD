# Maintainer: Nastya Kot <VanderOfCat@gmail.com>
pkgname=steamaudio-bin
_pkgname=steamaudio
pkgver=4.7.0
pkgrel=1
pkgdesc="A cross-platform software toolkit for spatial audio."
arch=('x86_64')
url="https://github.com/ValveSoftware/steam-audio"
license=('Apache-2.0')
source=("$url/releases/download/v$pkgver/${_pkgname}_${pkgver}.zip")
sha256sums=('ff3a7283bf7428c963dd2f9ba63738fc43e688ecb4727f7574e0ccf92c91bfb4')
depends=('gcc-libs' 'glibc')
provides=('libphonon.so')

package() {
    cd "${srcdir}/steamaudio"

    # Install the shared library
    install -Dm755 "lib/linux-x64/libphonon.so" "${pkgdir}/usr/lib/libphonon.so"

    # Install the header files
    install -d "${pkgdir}/usr/include/"
    cp -r "include"/* "${pkgdir}/usr/include/"

    # Install the debugging symbols
    install -Dm644 "symbols/linux-x64/libphonon.so.dbg" "${pkgdir}/usr/lib/debug/libphonon.so.dbg"
}
