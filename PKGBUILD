# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: Erik Bročko <erik.brocko@letemsvetemapplem.eu>

pkgname=csdr-luarvique
pkgver=0.18.26
pkgrel=1
pkgdesc="A simple DSP library and command-line tool for Software Defined Radio."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/luarvique/csdr"
license=('GPL3')
depends=('gcc-libs' 'libsamplerate' 'fftw')
makedepends=('git' 'cmake')
conflicts=('csdr')
provides=('csdr')
source=("$pkgname"::"git+https://github.com/luarvique/csdr.git#tag=${pkgver}")
md5sums=('SKIP')

#######################
# The fax image height is hardcoded to 1400
# If you wants to change the fax image height you must patch the source
#
# diff --git a/include/fax.hpp b/include/fax.hpp
# index f8a46b7..0c7c282 100644
# --- a/include/fax.hpp
# +++ b/include/fax.hpp
# @@ -72,7 +72,7 @@ namespace Csdr {
#                  FREQ_CARRIER   = 1900,
#                  FREQ_DEVIATION = 400,
#
# -                HEIGHT_IOC576  = 1400,
# +                HEIGHT_IOC576  = 2300,
#                  HEIGHT_IOC288  = 700,
#
#  //                HEIGHT_IOC576  = 1200,
#
#######################


build() {
	cmake -B build -S "$srcdir/$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev

	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
