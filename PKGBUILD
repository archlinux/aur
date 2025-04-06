# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=owrx_connector-luarvique
pkgver=0.6.5
pkgrel=2
pkgdesc="Connectors used by OpenWebRX to interface with SDR hardware."
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/owrx_connector"
license=('GPL3')
depends=('csdr-luarvique' 'libsamplerate' 'rtl-sdr' 'soapysdr' 'fftw')
makedepends=('git' 'cmake')
provides=('owrx_connector')
conflicts=('owrx_connector')

source=("$pkgname"::"git+https://github.com/luarvique/owrx_connector#tag=${pkgver}")
md5sums=('SKIP')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
