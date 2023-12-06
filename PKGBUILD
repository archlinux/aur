# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=dumphfdl
pkgver=1.5.0
pkgrel=1
pkgdesc="Multichannel HFDL decoder"
arch=('x86_64')
url="https://github.com/szpajder/dumphfdl"
license=('GPL3')
depends=('libacars' 'glib2' 'liquid-dsp' 'fftw' 'libconfig')
makedepends=('cmake' 'git')
optdepends=(
	'soapysdr'
	'libsdrplay: Proprietary API service for SDRplay devices.'
	'sqlite: for enriching messages with aircraft data read from SQB database'
	'statsd-c-client: for Etsy StatsD statistics'
	'zeromq: for ZeroMQ networked output'
	'gperftools: for profiling'
)
source=("$pkgname"::"git+https://github.com/szpajder/dumphfdl#tag=v${pkgver}")
md5sums=('SKIP')

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
