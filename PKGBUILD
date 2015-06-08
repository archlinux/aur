# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=libpfrng
pkgver=0.0.9
pkgrel=2
pkgdesc="CPU jitter based random number generator"
url="https://github.com/pfactum/libpfrng/"
arch=('i686' 'x86_64')
license=('LGPLv3')
depends=('glibc' 'zeromq')
makedepends=('gcc' 'cmake')
source=(https://github.com/pfactum/libpfrng/archive/v${pkgver}.tar.gz)

md5sums=(12057bdf82842e6abdf27c08481db208)

install='libpfrng.install'

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	# Detect CPUs count automatically
	CPUS_COUNT=`cat /proc/cpuinfo | grep processor | wc -l`
	echo "Compiling using $CPUS_COUNT thread(s)"
	make -j$CPUS_COUNT
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make install
}

