# RTAudio git version
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=rtaudio-git
pkgver="5.1.0.r67.g8f8250e"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="RTAudio git version without JACK support(fix for pipewire)"
license=('GPL')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libpulse')
makedepends=('make' 'git' 'cmake' 'doxygen')
provides=('rtaudio' 'librtaudio.so')
conflicts=('rtaudio')
source=("git://github.com/thestk/rtaudio")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rtaudio"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/rtaudio"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" -DRTAUDIO_API_JACK=OFF ..
    make
}

package() {
    cd "$srcdir/rtaudio/build"
    make DESTDIR="$pkgdir"  install
}
