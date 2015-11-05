# Contributor: Aaron Lindsay <aaron@aclindsay.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

_pkgname=libevhtp
pkgname="${_pkgname}"-seafile
pkgver=1.2.10
pkgrel=1
pkgdesc="A more flexible replacement for libevent's httpd API. [Built for seafile]"
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')
url="https://github.com/ellzey/libevhtp"
license=('BSD')
depends=('libevent>=2.0.0')
makedepends=('cmake')
provides=('libevhtp')
conflicts=('libevhtp')
source=("${_pkgname}-${pkgver}.zip::https://github.com/ellzey/libevhtp/archive/${pkgver}.zip")

build () {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DEVHTP_DISABLE_SSL=ON -DEVHTP_BUILD_SHARED=ON ./
	make
}

package () {
	#install library and header files
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	#copy license over
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
sha256sums=('9af608c08fb33e69832b789c158544be6141dfbf25bfb9dca2e3d62786d0e731')
