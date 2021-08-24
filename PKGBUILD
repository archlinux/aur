# Maintainer: Christian Kohlstedde <christian+aur@kohlsted.de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Alex 'AdUser' Z <ad_user@mail.ru>
pkgname=rdfind
pkgver=1.5.0
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files.'
arch=('i686' 'x86_64')
url='http://rdfind.pauldreik.se'
license=('GPL2')
depends=('nettle')
changelog=Changelog
source=("${url}/${pkgname}-${pkgver}.tar.gz"
	"${url}/${pkgname}-${pkgver}.tar.gz.asc"
	"https://github.com/pauldreik/rdfind/commit/61877de88d782b63b17458a61fcc078391499b29.patch"
)
validpgpkeys=("CC3C51BA88205B19728A6F07C9D9A0EA44EAE0EB")
sha256sums=('4150ed1256f7b12b928c65113c485761552b9496c433778aac3f9afc3e767080'
	'SKIP'
	'7b13344101bdadd91961929c38784675ff71b08d17b1370528858fe9f971a6c1')

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/61877de88d782b63b17458a61fcc078391499b29.patch"
}

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
