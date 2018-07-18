# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=rnp
pkgdesc='High performance C++ OpenPGP library derived from NetPGP'
pkgver=0.9.1
pkgrel=1
url='https://github.com/riboseinc/rnp'
license=(custom:BSD)
arch=(i686 x86_64)
makedepends=(cmake cmocka pkgconf)
depends=(botan zlib bzip2 json-c)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6ab74018e2a8cd8a27bc04180f813bd423ce7d94ce7abaeb393987eff8e11dc0ef20b2d0881e42211aaffb39999b2fad8d5d85ccc0731cce8828ff56979809a8')

build ()
{
	cd "${pkgname}-${pkgver}"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DENABLE_SANITIZERS=OFF \
		-DENABLE_COVERAGE=OFF \
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
