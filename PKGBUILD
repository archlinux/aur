# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=libcpucycles
epoch=
pkgver=20230115
pkgrel=2
pkgdesc="A microlibrary for counting CPU cycles"
url=https://cpucycles.cr.yp.to
license=(Unlicense)
arch=(x86_64)
makedepends=(python)
source=(${url}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('dd38c12205550216b92607f0f42727c52a0109a16af2eaa7a13835d53ebbc225')

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
