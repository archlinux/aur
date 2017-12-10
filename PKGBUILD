# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="brlaser"
pkgver=3
pkgrel=1
pkgdesc="CUPS driver for the Brother DCP-7065DN"
arch=('x86_64')
url="https://github.com/pdewacht/brlaser"
license=('GPL2')
depends=('cups')
source=("https://github.com/pdewacht/${pkgname}/archive/v${pkgver}.tar.gz" "0001-Add-missing-include-string.patch")
sha512sums=('79c4709e0db48fc4b359297f44c2ad35633e65210fdb941aea7a9a613de4d341319aaa7e72748f7ed821400c564b9a5c63677692103130e3a6ec5ff938e0cccf' '51f21653433adf2ba564aaee4fdda4c99132e8ffa802562f282d75a7d3d2ab61ff0a9b574164ba7e67b739595836960836668fe618b3961d0ea83dcf09536cc0')

prepare() {
	cd "${pkgname}-${pkgver}"
	patch -p1 < $srcdir/${source[1]}
}

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
