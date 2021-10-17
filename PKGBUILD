# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
pkgname=sdrpp-git
pkgver=1.0.4
pkgrel=5
epoch=
pkgdesc="The Bloat-free SDR Receiver"
arch=('any')
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=('GPL')
groups=()
depends=("fftw" "glfw" "glew" "libvolk" "rtaudio")
makedepends=("gcc" "make" "cmake" "soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay" "bladerf" "limesuite")
checkdepends=()
optdepends=("soapysdr" "libiio" "libad9361" "rtl-sdr" "airspy" "airspyhf-git" "hackrf" "libsdrplay" "bladerf" "limesuite")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/AlexandreRouma/SDRPlusPlus')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "SDRPlusPlus"
	mkdir build
	cd build
	cmake .. -DOPT_BUILD_SDRPLAY_SOURCE=ON -DOPT_BUILD_BLADERF_SOURCE=ON -DOPT_BUILD_LIMESDR_SOURCE=ON
	make $MAKEOPTS
}

package() {
	cd "SDRPlusPlus/build"
	make DESTDIR="$pkgdir/" install
}

pkgver() {
  	cd "SDRPlusPlus"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
