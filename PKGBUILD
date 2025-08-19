# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

pkgname="gr-pdu_utils-git"
pkgver=3.10
pkgrel=2
pkgdesc="GNU Radio pdu_utils smart meters modules (RECESSIM)"
arch=('x86_64' 'aarch64')
url='https://github.com/sandialabs/gr-pdu_utils/'
license=('GPL')
depends=('gnuradio' 'boost' 'pybind11' 'python-pygccxml')
makedepends=('git' 'cmake' 'doxygen')
provides=('gr-pdu_utils')
source=('git+https://github.com/sandialabs/gr-pdu_utils.git')
sha256sums=('SKIP')

prepare() {
	pushd gr-pdu_utils
	git checkout maint-3.10
	# https://wiki.recessim.com/view/Gr-smart_meters_Setup_on_other_distros
	git fetch origin refs/pull/23/head:pull_23
	git checkout pull_23
	popd
}

build() {
	pushd gr-pdu_utils
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j
	popd
}

package() {
	pushd gr-pdu_utils
	DESTDIR="$pkgdir" cmake --build build -t install
	popd
}

