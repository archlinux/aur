# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.11.0
pkgrel=1
url='https://github.com/riboseinc/rnp'
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf)
depends=(botan zlib bzip2 json-c)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('f0e03320026419b2020825996ff387c4039d032cb2e33d5129c315c02940291950b17c37c9b39d056c39e404a5320c104d4ce84a5872b75ee18c2a8045572908')

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
