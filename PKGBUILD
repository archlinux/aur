# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.12.0
pkgrel=1
url='https://github.com/riboseinc/rnp'
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf)
depends=(botan zlib bzip2 json-c)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('127524f9b3095d7fa17afe448084e25e9c22245e79f1d2dd93a6660726faf4b86e10474f7dbe6e6d93cd14b1a84193835cf584108f6edbed4de6106d88fbd25f')

build ()
{
	cd "${pkgname}-${pkgver}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF \
		-DBUILD_TESTING=OFF \
		-DBUILD_SHARED_LIBS=ON
	make
}

package ()
{
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" \
		README.md LICENSE.md LICENSE-OCB.md
}
