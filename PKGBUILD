# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Laurent Hofer <laurenth at laurenth dot net>

pkgname=pari25
_pkgname=pari
pkgver=2.5.5
pkgrel=2
pkgdesc='Computer algebra system designed for fast computations in number theory'
url='http://pari.math.u-bordeaux.fr/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gmp' 'libx11')
makedepends=('perl' 'texlive-core')
optdepends=('perl: gphelp, tex2mail')
conflicts=('pari')
provides=('pari')
source=("http://pari.math.u-bordeaux.fr/pub/pari/unix/OLD/2.5/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('77637f935ee4a3b78e7015cef00146bd2f7e96bc')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./Configure \
		--prefix=/usr \
		--with-readline \
		--with-gmp \

	make all
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make bench
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -sf gp.1.gz "${pkgdir}"/usr/share/man/man1/pari.1
}
