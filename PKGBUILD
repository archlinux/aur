# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=sgfutils
pkgver=0.25
pkgrel=1
pkgdesc='Collection of command line utilities that help working with SGF files'
url='https://homepages.cwi.nl/~aeb/go/sgfutils/'
license=('GPL')
arch=('x86_64')
depends=('openssl')
source=("${url}${pkgname}-${pkgver}.tgz")
sha256sums=('4b26b321fbe255722f1d7e57233614da89a4da5bab031ae4ef7118ae3c7436a2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed 's/^CFLAGS=/CFLAGS+=/' -i Makefile
	make all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	ls | while read i; do
	if [[ ! -d "$i" && -x "$i" ]]; then
		install -D "$i" "${pkgdir}/usr/bin/$i"
	fi
	done

	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -a html/* "${pkgdir}/usr/share/doc/${pkgname}"
}
