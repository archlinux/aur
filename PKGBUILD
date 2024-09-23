# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
_name=bm3d
pkgname="${_name}-git"
pkgver=r30.7200744
pkgrel=1
pkgdesc='BM3D image denoising'
url="https://github.com/gfacciol/${_name}"
depends=('libpng' 'libtiff' 'libjpeg' 'fftw')
makedepends=('cmake')
license=('GPL3')
arch=('x86_64')
source=(git+"${url}.git")
sha256sums=('SKIP')
provides=("${_name}")
conflicts=("${_name}")

pkgver() {
  cd ${_name}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/${_name}"
	mkdir -p build
	cd build
	cmake ..
	make
}


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/${_name}/build/${_name}" "${pkgdir}/usr/bin/"
}

