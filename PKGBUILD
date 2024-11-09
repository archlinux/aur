# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

pkgname="gr-smart_meters-git"
pkgver=3.10
pkgrel=1
pkgdesc="GNU Radio smart meters block (RECESSIM)"
arch=('x86_64' 'aarch64')
url='https://github.com/BitBangingBytes/gr-smart_meters'
license=('GPL')
depends=('gnuradio' 'boost' 'graphviz' 'pybind11' 'gr-pdu_utils' 'gr-timing_utils' 'gr-fhss_utils')
makedepends=('git' 'cmake' 'doxygen')
optdepends=('gr-fosphor: to view input spectrum'
	    'python-gmplot: plot GPS data on Google Maps')
provides=('gr-smart_meters')
source=('git+https://github.com/BitBangingBytes/gr-smart_meters.git')
sha256sums=('SKIP')

prepare() {
	pushd gr-smart_meters
	git checkout maint-3.10
	popd
}

build() {
	pushd gr-smart_meters
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr 
	cmake --build build -j
	popd
}

package() {
	pushd gr-smart_meters
	DESTDIR="$pkgdir" cmake --build build -t install
	popd
}

