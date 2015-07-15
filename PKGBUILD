pkgname=mupen64plus-video-gliden64
pkgver=1.2
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for N64 emulators"
arch=('i686' 'x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL')
depends=('mupen64plus')
makedepends=('cmake' 'boost')
source=(https://github.com/gonetz/GLideN64/archive/Public_Release_${pkgver}.tar.gz)
sha256sums=('bcaa6438da366cfbd769a2768644b3c27bcf132ba7ae0a406db34d7ab9ad0e3c')

build() {
    cd "$srcdir/GLideN64-Public_Release_$pkgver/src"

    echo "#define PLUGIN_REVISION \"${pkgver}\"" > "Revision.h"

    cmake -D MUPENPLUSAPI=On CMakeLists.txt
    make
}

package() {
    cd "$srcdir/GLideN64-Public_Release_$pkgver/src/plugin/release"

    install -Dm644 "mupen64plus-video-GLideN64.so" "$pkgdir/usr/lib/mupen64plus/mupen64plus-video-GLideN64.so"
}
