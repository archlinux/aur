# Maintainer: Vinicius Moura Longaray <vmouralongaray@gmail.com>
pkgname=spectrum-git
pkgver=r262.94dafa9
pkgrel=1
pkgdesc="Console-based music player with equalizer written in C++."
arch=("any")
url="https://github.com/v1nns/spectrum"
license=("MIT")
depends=()
makedepends=("git" "cmake" "alsa-lib" "ffmpeg" "fftw")
provides=("spectrum")
conflicts=("spectrum")
source=("spectrum::git+https://github.com/v1nns/spectrum")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/spectrum"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/spectrum"
    mkdir -p build && cd build
    CXXFLAGS="$CFLAGS" cmake \
        -DENABLE_INSTALL=ON \
        -DSPECTRUM_DEBUG=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_COVERAGE=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..

    cmake --build .
}

package() {
    cd "$srcdir/spectrum"
    cd build
    DESTDIR="$pkgdir/" cmake --install .
}
