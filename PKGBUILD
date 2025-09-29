# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
pkgname=krakenrf-gr-krakensdr-git
_gitname=gr-krakensdr
pkgver=r22.ea3a015
pkgrel=1
pkgdesc='GNU Radio block for KrakenRF Heimdall DAQ'
url='https://github.com/krakenrf/gr-krakensdr'
arch=('any')
license=('GPL-2.0-only')
depends=('glibc' 'gnuradio' 'boost-libs' 'python' 'python-numpy')
makedepends=('cmake' 'boost' 'git')
provides=('krakenrf-gr-krakensdr')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"

	mkdir -p build
	cd build
	cmake .. \
		-Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	cmake --build . -j4
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make DESTDIR="${pkgdir}" install
}
