# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=dumphfdl
pkgver=1.7.0
pkgrel=2
pkgdesc="Multichannel HFDL decoder"
arch=('x86_64' 'aarch64')
url="https://github.com/szpajder/dumphfdl"
license=('GPL3')
depends=('libacars' 'glib2' 'liquid-dsp' 'fftw' 'libconfig' 'soapysdr' 'sqlite' 'statsd-c-client' 'zeromq')
makedepends=('cmake' 'git')
optdepends=(
    'libsdrplay: Proprietary API service for SDRplay devices.'
    'gperftools: for profiling'
)
source=(
    "$pkgname"::"git+https://github.com/szpajder/dumphfdl#tag=v${pkgver}"
)
sha256sums=(
    'SKIP'
)

build() {
    cmake -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -S "$srcdir/$pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
}
