# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=libcpucycles
epoch=
pkgver=20230105
pkgrel=1
pkgdesc="A microlibrary for counting CPU cycles"
url=https://cpucycles.cr.yp.to/
license=(Unlicense)
arch=(x86_64)
makedepends=(python)
source=(${url}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3507da28299972b064f32db9edb2295f85bc8cb9cf7f2dcb611eee4ca3b98a51')

build() {
	cd ${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}

	install -Dt "${pkgdir}"/usr/bin -m0755 build/0/package/bin/cpucycles-info
	install -Dt "${pkgdir}"/usr/lib -m0644 build/0/package/lib/libcpucycles.so.1
	ln -s libcpucycles.so.1 "${pkgdir}"/usr/lib/libcpucycles.so
	install -Dt "${pkgdir}"/usr/include -m0644 build/0/package/include/cpucycles.h
	install -Dt "${pkgdir}"/usr/share/man/man3 build/0/package/man/man3/cpucycles.3
}
