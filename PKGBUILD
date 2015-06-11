# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: Aaron Lindsay <aaron@aclindsay.com>

_pkgname=libevhtp
pkgname="${_pkgname}"-seafile
pkgver=1.2.9
pkgrel=1
pkgdesc="A more flexible replacement for libevent's httpd API. [Built for seafile]"
arch=('i686' 'x86_64' 'armv5te' 'armv6h' 'armv7h')
url="https://github.com/ellzey/libevhtp"
license=('BSD')
depends=('libevent>=2.0.0')
makedepends=('cmake')
optdepends=()
provides=('libevhtp')
conflicts=('libevhtp')
options=()
source=("https://github.com/ellzey/libevhtp/archive/${pkgver}.zip")

build () {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DEVHTP_DISABLE_SSL=ON -DEVHTP_BUILD_SHARED=ON ./
	make
}

package () {
	#install library and header files
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	#copy license over
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
sha256sums=('9007ed1e6e4509b677267d4cea69248a84da6e43552c6363e0f09c55f4795f68')
