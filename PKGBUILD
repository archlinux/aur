# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.10.0
pkgrel=1
url='https://github.com/riboseinc/rnp'
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake pkgconf)
depends=(botan zlib bzip2 json-c)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('c11160d9a0f93c3912f3f80ea5ab346e9ef6c9f04b079b0b2a2840869ce1997e8dd67efcec6296ce2e70f434bebb6dffd455e7aadcadf082c7058bc73113d33d')

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
