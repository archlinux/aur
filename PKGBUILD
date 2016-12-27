pkgname=mupen64plus-video-gliden64
pkgver=2.0
_pkgver=2_0
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for N64 emulators"
arch=('i686' 'x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL')
depends=('mupen64plus')
makedepends=('cmake' 'boost')
source=(https://github.com/gonetz/GLideN64/archive/Public_Release_${_pkgver}.tar.gz)
sha256sums=('c1214e29a33ee5058d0a333d362851d466f496450bfc156c1c44f3864649e482')

build() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src"

    echo "#define PLUGIN_REVISION \"${pkgver}\"" > "Revision.h"

    cmake -D MUPENPLUSAPI=On CMakeLists.txt
    make
}

package() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src/plugin/release"

    install -Dm644 "mupen64plus-video-GLideN64.so" "$pkgdir/usr/lib/mupen64plus/mupen64plus-video-GLideN64.so"
}
