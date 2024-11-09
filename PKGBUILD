# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

pkgname="gr-timing_utils-git"
pkgver=3.10
pkgrel=1
pkgdesc="GNU Radio gr-timing_utils smart meters modules (RECESSIM)"
arch=('any')
url='https://github.com/sandialabs/gr-timing_utils/'
license=('GPL')
depends=('gnuradio' 'boost' 'gr-pdu_utils')
makedepends=('git' 'cmake' 'doxygen')
provides=('gr-timing_utils')
source=('git+https://github.com/sandialabs/gr-timing_utils.git')
sha256sums=('SKIP')

prepare() {
	pushd gr-timing_utils
	git checkout maint-3.10
	# https://wiki.recessim.com/view/Gr-smart_meters_Setup_on_other_distros
	git fetch origin refs/pull/9/head:pull_9
	git checkout pull_9
	popd
}

build() {
	pushd gr-timing_utils
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-fpermissive"
	cmake --build build -j
	popd
}

package() {
	pushd gr-timing_utils
	DESTDIR="$pkgdir" cmake --build build -t install
	popd
}

