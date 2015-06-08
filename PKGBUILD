# Maintainer: Oleksandr Natalenko aka post-factum <oleksandr@natalenko.name>
pkgname=pingtcp
pkgver=0.0.2
pkgrel=2
pkgdesc="Small utility to measure TCP handshake time (torify-friendly)"
url="https://github.com/LanetNetwork/pingtcp"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('glibc' 'gcc-libs')
optdepends=('gperftools: for libtcmalloc' 'torsocks: for TOR support')
makedepends=('cmake' 'git' 'make')
source=(${pkgname}::git+https://github.com/LanetNetwork/pingtcp.git)

md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	git submodule init
	git submodule update
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	# Detect CPUs count automatically
	CPUS_COUNT=$(nproc)
	echo "Compiling using $CPUS_COUNT thread(s)"
	make -j$CPUS_COUNT
}

package() {
	cd ${srcdir}/${pkgname}/build
	make install
}

