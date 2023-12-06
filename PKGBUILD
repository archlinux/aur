# Maintainer: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=owrx_connector-luarvique
pkgver=0.6.4
pkgrel=1
pkgdesc="Connectors used by OpenWebRX to interface with SDR hardware."
arch=('x86_64')
url="https://github.com/luarvique/owrx_connector"
license=('GPL3')
depends=('csdr' 'libsamplerate')
makedepends=('git' 'cmake')
optdepends=(
	'rtl-sdr: RTLSDR dongles support.'
	'soapysdr: Allows interfacing with SDRs of many vendors.'
)
provides=('owrx_connector')
conflicts=('owrx_connector')

# The source don't have the tag for 0.6.4
#source=("$pkgname"::"git+https://github.com/luarvique/owrx_connector#tag=${pkgver}")
source=("$pkgname"::"git+https://github.com/luarvique/owrx_connector#commit=8bc8c17f235326ba25dbb9f1015dc649e91faa75")
md5sums=('SKIP')

build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
