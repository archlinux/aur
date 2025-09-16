# Maintainer: Raimar Buehmann <raimar _at_ buehmann _dot_ de>

pkgname=ais-catcher
pkgver=0.62
_commit=bd9aec9
pkgrel=1
pkgdesc='Receiver for Automatic Identifaction System of boats using an SDR device (RTL-SDR, AirSpy, HackRF, ...)'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/jvde-github/AIS-catcher"
depends=(
	zlib
	libsoxr
	libsamplerate
	zeromq
	openssl
)
makedepends=(cmake)
optdepends=(
	'airspy: Airspy backend'
	'hackrf: HackRF backend'
	'rtl-sdr: RTL-SDR backend'
	'bladerf: BladeRF backend'
)
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')
build() {
	cd "$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 .
	cd build
	cmake --build .
}
package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" cmake --install build
}
