# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>
pkgname=dumpvdl2-git
pkgver=r794.fc653ae
pkgrel=1
pkgdesc="VDL Mode 2 message decoder and protocol analyzer "
arch=('any')
url="https://github.com/szpajder/dumpvdl2"
license=('GPL3')
depends=('libacars' 'glib2')
makedepends=('cmake' 'git')
optdepends=(
	'rtl-sdr: RTLSDR dongles support'
	'libmirisdr4: FOSS driver for RSP1-based devices.'
	'soapysdr'
	'libsdrplay: Proprietary API service for SDRplay devices.'
	'sqlite: for enriching messages with aircraft data read from SQB database'
	'statsd-c-client: for Etsy StatsD statistics'
	'protobuf-c: for binary format support'
	'zeromq: for ZeroMQ networked output'
)
source=("$pkgname"::"git+https://github.com/szpajder/dumpvdl2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
