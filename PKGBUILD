# Maintainer: Mitch Bigelow <ipha00@gmail.com>
# Contributor: Ray Griffin <rorgoroth@gmail.com>
# Contributor: Mariusz Kujawski <marinespl@gmail.com>
# Contributor: Wes Brewer <brewerw@gmail.com>

pkgname=xautoclick
pkgver=0.31
pkgrel=5
pkgdesc="Automates repetitive mouse clicking to reduce RSI."
arch=('i686' 'x86_64')
url="http://xautoclick.sourceforge.net"
license=('GPL')
depends=('libxtst')
optdepends=('gtk: for gtk based gui'
			'gtk2: for gtk2 based gui'
			'qt3: for qt3 based gui'
			'qt4: for qt4 based gui'
			'fltk: for fltk based gui')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('87f6446c084e19f1f7c23db5256ff224')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=${pkgdir}/usr

	sed -i 's/LDFLAGS=/LDFLAGS=-lstdc++ /' config.mak

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR=${pkgdir} install

 	install -d ${pkgdir}/usr/share
 	mv ${pkgdir}/usr/man ${pkgdir}/usr/share
}
