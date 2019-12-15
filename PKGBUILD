# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

_perlmod=ora2pg
pkgname=perl-ora2pg
pkgver=20.0
pkgrel=1
pkgdesc="Moves Oracle databases to PostgreSQL"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL' 'PerlArtistic')
depends=('perl-dbd-oracle')
makedepends=()
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${_perlmod}/${_perlmod}-${pkgver}.tar.bz2")
md5sums=('989b48c289c2febd9f200d170a6e8d77')

build() {
	cd "${_perlmod}-${pkgver}"

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL \
		DESTDIR=${pkgdir} \
		DOCDIR=/usr/share/doc/${pkgname} \
		INSTALLDIRS=vendor -l
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}" SYSCONFDIR="${pkgdir}/etc"
}
