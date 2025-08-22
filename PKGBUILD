# Maintainer: Carey Metcalfe <carey@[first initial + last name].ca>

pkgname=audiowaveform
pkgver=1.10.3
pkgrel=1
pkgdesc="Generate waveform data and render waveform images from audio files"
arch=('i686' 'x86_64')
url="https://github.com/bbc/audiowaveform"
license=('GPL-3.0-only')
depends=('libmad' 'libsndfile' 'libid3tag' 'gd' 'boost-libs' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbc/audiowaveform/archive/$pkgver.tar.gz")
sha256sums=('191b7d46964de9080b6321411d79c6a2746c6da40bda283bb0d46cc7e718c90b')

build() {
    cd "$pkgname-$pkgver"
    cmake \
        -B build \
        -S . \
        -DENABLE_TESTS=0 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS"
    cd build
    make
}

package() {
    cd "$pkgname-$pkgver/build"
    DESTDIR="$pkgdir" make install
}
