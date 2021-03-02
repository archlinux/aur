# Maintainer: Alexandre Rouma <whatsthetgeek@gmail.com>
pkgname=sdrpp-git
pkgver=0.2.5
pkgrel=5
epoch=
pkgdesc="The Bloat-free SDR Receiver"
arch=('any')
url="https://github.com/AlexandreRouma/SDRPlusPlus"
license=('GPL')
groups=()
depends=("fftw" "glfw" "glew" "libvolk" "soapysdr" "libiio" "libad9361" "rtaudio" "rtl-sdr" "airspy-git" "airspyhf-git")
makedepends=("gcc" "make" "cmake")
checkdepends=()
optdepends=()
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
	cmake ..
	make -j$(nproc)
}

package() {
	cd "SDRPlusPlus/build"
	make DESTDIR="$pkgdir/" install
}

pkgver() {
  	cd "SDRPlusPlus"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}