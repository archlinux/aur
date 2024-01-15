# Maintainer: Precise <Discord: precise_pro>

pkgname=rtaudio5-exp
pkgver=5.2.0
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
pkgdesc="rtaudio 5.2.0 Use when absolutely necessary! Cross-platform C++ classes that provide a common API for real-time audio input/output."
license=('GPL')
url="https://github.com/thestk/rtaudio"
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libpulse')
makedepends=('make' 'cmake' 'doxygen')
provides=('rtaudio' 'rtaudio5-exp')
conflicts=('rtaudio' 'rtaudio-docs' 'rtaudio5-exp')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('a4bce0860b7d8e1fb2f0df98bd655adb')

build() {
    cd "$srcdir/rtaudio-${pkgver}"
    mkdir -p build
    cd build
    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH="/usr" -DRTAUDIO_API_JACK=OFF -DRTAUDIO_BUILD_TESTING=OFF ..
    make
}

package() {
    cd "$srcdir/rtaudio-${pkgver}/build"
    make DESTDIR="$pkgdir" install
}
