# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='licenseutils'
pkgver='0.0.9'
pkgrel=1
pkgdesc='Create copyright and license notices at the beginning of source code files'
arch=('i686' 'x86_64')
url="http://sv.gnu.org/p/${pkgname}"
license=('GPL')
makedepends=('boost' 'help2man')
depends=('source-highlight' 'libpng' 'curl' 'glib2')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("http://download.savannah.nongnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'io_eof_seen.patch')
sha256sums=('cec455e207ca5fce8c09a9a2ac658d39b79324eba335f671f9cb5141deb912cc'
            'cddd1e43af1b8bae800004477f5d2f51f8bccdd303de2753a5f6e49f5e646c9c')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/io_eof_seen.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

