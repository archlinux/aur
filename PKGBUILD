# Contributor: Paulo Castro <p.oliveira.castro@gmail.com>

pkgname=nest
pkgver=2.14.0
pkgrel=1
pkgdesc="Simulator for spiking neural network models"
arch=('x86_64')
url="http://www.nest-simulator.org/"
license=('GPL')
depends=('gsl' 'libtool' 'python')
makedepends=('cmake' 'cython')
optdepends=('ipython' 'python-numpy' 'python-scipy' 'python-matplotlib')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/nest/nest-simulator/archive/v${pkgver}.tar.gz)
md5sums=('a214b61da740c9252f3dfea5ed804441')


prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$pkgname-simulator-$pkgver \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Dwith-gsl=ON \
		-Dwith-readline=ON \
		-Dwith-ltdl=ON \
		-Dwith-python=3
	make
}

# Tests fail if no nest can be found in /usr/bin/
#check() {
#	cd build
#	make -k check
#}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
