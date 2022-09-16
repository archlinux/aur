# Maintainer: Aang23 <aang23@altillimity.com>
pkgname=satdump-git
pkgver=r1747.6e5b1325
pkgrel=1
epoch=
pkgdesc="A generic satellite processing software"
arch=('any')
url="https://github.com/altillimity/SatDump"
license=('GPL')
groups=()
depends=("libvolk" "glfw" "glew" "fftw" "airspy" "airspyhf" "rtl-sdr" "hackrf" "libusb" "libiio" "libad9361" "ocl-icd" "zstd" "nng")
makedepends=("gcc" "make" "cmake")
checkdepends=()
optdepends=("limesuite" "bladerf")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/altillimity/SatDump')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "SatDump"
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make $MAKEOPTS
}

package() {
	cd "SatDump/build"
	make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "SatDump"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
