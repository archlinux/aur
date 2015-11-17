# Maintainer: David Phillips <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=abduco
pkgver=0.4
pkgrel=1
conflicts=${pkgname}-git
pkgdesc="Tool for session {at,de}tach support which allows a process to run independently from its controlling terminal"
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/${pkgname}/"
license=('GPL')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#        "config.h")
sha512sums=('1f6df3604f5b4b59a650ccb8b6b7f9e62591154f72163350b8c8d2ffa9c392c9ebda0f958537a203e87319e275674fec6d161f18a10d49e44d0afc512c467f88')
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
