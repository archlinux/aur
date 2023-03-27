# RTAudio git version
# Maintainer: cropinghigh <joinmark60@gmail.com>
pkgname=rtaudio-git
pkgver=r647.268e64a
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="RTAudio git version without JACK support(fix for pipewire)"
license=('GPL')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libpulse')
makedepends=('make' 'git' 'cmake' 'doxygen' 'patch')
provides=('rtaudio' 'librtaudio.so')
conflicts=('rtaudio')
source=("git+https://github.com/thestk/rtaudio")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/rtaudio"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/rtaudio"
#     patch < "$srcdir/alsa_pcm.patch"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" -DRTAUDIO_API_JACK=OFF ..
    make
}

package() {
    cd "$srcdir/rtaudio/build"
    make DESTDIR="$pkgdir"  install
}
