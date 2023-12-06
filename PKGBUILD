# RTAudio v6
# Maintainer: NorthWestWind <wsyn148@gmail.com>
pkgname=rtaudio6
pkgver=6.0.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A set of C++ classes that provide a common API for realtime audio input/output across Linux (native ALSA, JACK, PulseAudio and OSS), Macintosh OS X (CoreAudio and JACK), and Windows (DirectSound, ASIO, and WASAPI) operating systems."
license=('GPL')
url="https://github.com/thestk/rtaudio"
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libpulse')
makedepends=('make' 'git' 'cmake' 'doxygen' 'patch')
provides=('rtaudio' 'librtaudio.so')
conflicts=('rtaudio')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('a3bacf1e5eff95e1697ce8b4f2797f8e')

build() {
    cd "$srcdir"
    tar -xf "${pkgver}.tar.gz"
    cd "rtaudio-${pkgver}"

    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" -DRTAUDIO_API_JACK=OFF ..
    make
}

package() {
    cd "$srcdir/rtaudio-${pkgver}/build"
    make DESTDIR="$pkgdir"  install
}
