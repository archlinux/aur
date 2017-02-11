# Maintainer: Tercio Martins < echo dGVjbm90ZXJjaW8ge2F0fSB5YWhvbyB7ZG90fSBjb20ge2RvdH0gYnIK | base64 -d >

pkgname=shenidam-git
_pkgname=shenidam
pkgver=1.0.r9.g08b029a
pkgrel=1
pkgdesc="Lightweight audio mapping software for AV footage"
arch=('i686' 'x86_64')
url="https://stendardo.org/shenidam"
license=('GPL')
depends=('boost-libs' 'fftw' 'libsamplerate' 'libsndfile' 'python2-pyqt4')
makedepends=('boost' 'git')
provides=('shenidam')
conflicts=('shenidam')
source=('git+https://github.com/stendardo/shenidam')
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir build
	cd build
	cmake -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 \
	-DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"
	make DESTDIR="$pkgdir/" install
}
