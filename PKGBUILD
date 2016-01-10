# Maintainer: David Phillips <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=abduco
pkgver=0.5
pkgrel=1
conflicts=${pkgname}-git
pkgdesc="Tool for session {at,de}tach support which allows a process to run independently from its controlling terminal"
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/${pkgname}/"
license=('GPL')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#        "config.h")
sha512sums=('e0772b8eecc1fb6f16c7516a6956825b9bda4149f00f56b34e68ec3544f74c2270ba8cc2642599de26ae34d11ed78b8bba70497bfc9a79f3008f50de02ce49d8')
#            'SKIP')

prepare () {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# Copy config file into build dir, if present
	if [ -f "${srcdir}/config.h" ]; then
		cp "${srcdir}/config.h" .
	fi
}

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make all
}
	
package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install PREFIX="${pkgdir}/usr"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
