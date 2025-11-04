# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=ais-catcher
pkgver=0.62
pkgrel=3
pkgdesc='Receiver for Automatic Identifaction System of boats using an SDR device (RTL-SDR, AirSpy, HackRF, ...)'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/jvde-github/AIS-catcher"
depends=(
	glibc
	gcc-libs
	zlib
	libsoxr
	libsamplerate
	zeromq
	openssl
	sqlite
	rtl-sdr
)
makedepends=(cmake)
optdepends=(
	'airspy: Airspy backend'
	'hackrf: HackRF backend'
	'bladerf: BladeRF backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dd43075e1a8b015ab40be9933e37adfd4c25eee215f38c0f051ec4b716515926')
build() {
	cd AIS-catcher-$pkgver
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
	cd build
	cmake --build .
}
package() {
	cd AIS-catcher-$pkgver
	DESTDIR="$pkgdir" cmake --install build
}
