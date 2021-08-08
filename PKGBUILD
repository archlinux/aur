# Maintainer: Aang23 <aang23@altillimity.com>
pkgname=satdump-git
pkgver=1.0
pkgrel=5
epoch=
pkgdesc="A generic satellite processing software"
arch=('any')
url="https://github.com/altillimity/SatDump"
license=('GPL')
groups=()
depends=("libvolk" "glfw" "glew" "fftw" "libcorrect-git")
makedepends=("gcc" "make" "cmake" "libcorrect-git" "airspy" "rtl-sdr" "hackrf")
checkdepends=()
optdepends=()
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
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_LIVE=ON ..
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
