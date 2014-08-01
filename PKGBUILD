pkgname='dwt-git'
pkgver=0.5.1.r27.g01db773
pkgrel=1
pkgdesc='Simple no-frills terminal emulator based on VTE - Git build'
license='MIT'
url='https://github.com/aperezdc/dwt'
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('vte3')
options=('strip' 'zipman')
provides=('dwt')
conflicts=('dwt')

pkgver () {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${srcdir}/${pkgname}"
	flags='-DDWT_DEFAULT_FONT=\"Inconsolata\ 12\"'
	flags="${flags} -DDWT_USE_POPOVER=TRUE"
	make PREFIX=/usr EXTRA_CFLAGS="${flags}"
}

package () {
	cd "${srcdir}/${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	chmod 2755 "${pkgdir}/usr/man" "${pkgdir}/usr/man/man1"
}
