# Maintainer: Edoardo Signorini <contact at edoars dot me>
# Contributor: Oleksandr Natalenko <oleksandr at natalenko dot name>

pkgname=libcpucycles
epoch=
pkgver=20240114
pkgrel=1
pkgdesc="A microlibrary for counting CPU cycles"
url=https://cpucycles.cr.yp.to
license=(Unlicense)
arch=(x86_64)
makedepends=(python)
source=(${url}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e3d32462a53ba323b03b8b63544bcadca8a11514fb323e135661e22368316f02')

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
