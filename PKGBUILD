# Maintainer: Christian Kohlstedde <christian+aur@kohlsted.de>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Alex 'AdUser' Z <ad_user@mail.ru>
pkgname=rdfind
pkgver=1.3.5
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files.'
arch=('i686' 'x86_64')
url='http://rdfind.pauldreik.se'
license=('GPL2')
depends=('nettle')
changelog=Changelog
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c36e0a1ea35b06ddf1d3d499de4c2e4287984ae47c44a8512d384ecea970c344')

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

