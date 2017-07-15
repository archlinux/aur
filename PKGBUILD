# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former maintainer: Florian Schweikert <kelvan at ist-total.org>
pkgname=qpid-proton
pkgver=0.17.0
pkgrel=2
pkgdesc="Proton is a high-performance, lightweight messaging library"
arch=('i686' 'x86_64' 'armv7h')
url="https://qpid.apache.org/releases/"
license=('APACHE')
depends=('python2' 'openssl-1.0')
makedepends=('util-linux' 'python2' 'cmake' 'swig')
optdepends=()
source=("https://www-us.apache.org/dist/qpid/proton/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6ffd26d3d0e495bfdb5d9fefc5349954e6105ea18cc4bb191161d27742c5a01a')

build() {
	cd "${srcdir}/qpid-proton-${pkgver}"

	mkdir build
	cd build

	cmake .. \
		-DSYSINSTALL_BINDINGS=ON \
		-DPYTHON_EXECUTABLE=/usr/bin/python2.7 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python2.7/ \
		-DPYTHON_LIBRARY=/lib/libpython2.7.so \
		-DOPENSSL_SSL_LIBRARY=/usr/lib/libssl.so.1.0.0 \
		-DOPENSSL_CRYPTO_LIBRARY=/usr/lib/libcrypto.so.1.0.0 \
		-DOPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_PHP=OFF \
		-DBUILD_RUBY=OFF \
		-DBUILD_PERL=OFF \
		-DBUILD_JAVA=OFF \
		-DBUILD_PYTHON=ON \
		-DCMAKE_INSTALL_LIBDIR=/lib \
		-DLIB_SUFFIX=""

	cmake --build .
}

package() {
	cd "${srcdir}/qpid-proton-${pkgver}/build"

	make DESTDIR="${pkgdir}/" install
}

