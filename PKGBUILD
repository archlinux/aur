# Maintainer: electron271 <electron271@allthingslinux.org>
# Contributor: Aang23 <aang23@altillimity.com>
pkgname=satdump-git
pkgver=r5718.d5d9391c
pkgrel=1
epoch=
pkgdesc="A generic satellite processing software"
arch=("any")
url="https://github.com/SatDump/SatDump"
license=("GPL")
groups=()
depends=("airspy" "fftw" "glfw" "hackrf" "jemalloc" "libad9361" "libpng" "libvolk" "nng" "ocl-icd" "portaudio" "rtl-sdr" "zenity" "zstd" "libtiff" "libiio")
makedepends=("boost" "cmake" "opencl-headers")
checkdepends=()
optdepends=("limesuite" "bladerf")
provides=()
conflicts=("satdump")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/SatDump/SatDump")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

build() {
	cd "SatDump"
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
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
