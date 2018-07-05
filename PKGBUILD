# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.9.0
pkgrel=1
url='https://github.com/riboseinc/rnp'
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake cmocka pkgconf)
depends=(botan zlib bzip2 json-c)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('326d2775423b604ed3a189a1c9714746f9610b1c888a69edcc34cf6d58cd31d5491a8364730fdb787d994eda93f56ffe4b8001117cb29b774904b5a342458149')

build ()
{
	cd "${pkgname}-${pkgver}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF
	make
}

package ()
{
	cd "${pkgname}-${pkgver}"
	DESTDIR="${pkgdir}" make install
	install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" \
		README.md LICENSE.md LICENSE-OCB.md
}
