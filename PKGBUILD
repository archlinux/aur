# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=pari-git
_pkgname=pari
pkgver=20180829.7e6668b4f
pkgrel=1
pkgdesc='Computer algebra system designed for fast computations in number theory'
url='https://pari.math.u-bordeaux.fr/'
license=('GPL')
arch=('x86_64')
depends=('gmp' 'readline' 'libx11')
makedepends=('perl' 'texlive-core' 'git')
optdepends=('perl: gphelp, tex2mail')
source=('git+http://pari.math.u-bordeaux.fr/git/pari.git')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	./Configure \
		--prefix=/usr \
		--with-readline \
		--mt=pthread \
		--with-gmp \

	make all
}

check() {
	cd "${srcdir}/${_pkgname}"
	make bench
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
	ln -sf gp.1.gz "${pkgdir}"/usr/share/man/man1/pari.1
}
