# Maintainer: David Phillips <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=abduco
pkgver=0.6
pkgrel=1
conflicts=(${pkgname}-git)
pkgdesc="Tool for session {at,de}tach support which allows a process to run independently from its controlling terminal"
arch=('i686' 'x86_64')
url="http://www.brain-dump.org/projects/${pkgname}/"
license=('GPL')
source=("http://www.brain-dump.org/projects/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#        "config.h")
sha512sums=('3b70a5cc10f0a2743dcbdf6eebdcfcee0e4f4ff8c6ce0bf0aa9f55c3fa85ab43aa659997735e063eab36aba69f91be7bb5519f3f632bff1b9098f5179165c1f2')
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
