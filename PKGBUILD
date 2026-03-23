# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=dumphfdl
pkgver=1.7.0
pkgrel=3
pkgdesc="Multichannel HFDL decoder"
arch=('x86_64' 'aarch64')
url="https://github.com/szpajder/dumphfdl"
license=('GPL-3.0-only')
depends=('libacars' 'glib2' 'liquid-dsp' 'fftw' 'libconfig' 'soapysdr' 'sqlite' 'statsd-c-client' 'zeromq')
makedepends=('cmake' 'git')
optdepends=(
    'libsdrplay: Proprietary API service for SDRplay devices.'
    'gperftools: for profiling'
)
source=(
    "$pkgname"::"git+https://github.com/szpajder/dumphfdl#tag=v${pkgver}"
)
sha256sums=('80a3b53266e0efd177ba4134d966016cffae96a191eb465408e5d89c67e6395c')

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
