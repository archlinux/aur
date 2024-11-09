# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

pkgname="gr-fhss_utils-git"
pkgver=3.10
pkgrel=1
pkgdesc="GNU Radio fhss_utils smart meters modules (RECESSIM)"
arch=('x86_64' 'aarch64')
url='https://github.com/sandialabs/gr-fhss_utils'
license=('GPL')
depends=('gnuradio' 'boost' 'gr-pdu_utils' 'gr-timing_utils')
makedepends=('git' 'cmake' 'doxygen')
provides=('gr-fhss_utils')
source=('git+https://github.com/sandialabs/gr-fhss_utils.git')
sha256sums=('SKIP')

prepare() {
	pushd gr-fhss_utils
	git checkout maint-3.10
	popd
}

build() {
	pushd gr-fhss_utils
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-fpermissive"
	cmake --build build -j
	popd
}

package() {
	pushd gr-fhss_utils
	DESTDIR="$pkgdir" cmake --build build -t install
	popd
}

