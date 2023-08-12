# Maintainer: Christian Kohlstedde <christian+aur@kohlsted.de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Alex 'AdUser' Z <ad_user@mail.ru>
pkgname=rdfind
pkgver=1.6.0
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files.'
arch=('i686' 'x86_64')
url='http://rdfind.pauldreik.se'
license=('GPL2')
depends=('nettle')
source=("${url}/${pkgname}-${pkgver}.tar.gz"
	"${url}/${pkgname}-${pkgver}.tar.gz.asc"
)
validpgpkeys=("CC3C51BA88205B19728A6F07C9D9A0EA44EAE0EB")
sha256sums=('7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make -s
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	# documentation
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -m644 \
		AUTHORS \
		ChangeLog \
		README \
		TODO \
		"$pkgdir/usr/share/doc/$pkgname"
}
