# Contributor: Antonio Muñoz <agmconejo AT gmail DOT com>

_perlmod=ora2pg
pkgname=perl-ora2pg
pkgver=16.0
pkgrel=1
pkgdesc="Moves Oracle databases to PostgreSQL"
arch=('any')
url="http://ora2pg.darold.net"
license=('GPL' 'PerlArtistic')
depends=('perl-dbd-oracle')
makedepends=()
options=('!emptydirs')
source=("http://downloads.sourceforge.net/${_perlmod}/${_perlmod}-${pkgver}.tar.bz2" "destdir.patch")
md5sums=('2b6c87b84086580f35c788174a32ecb3'
         '7fc24b5df9de34bb8ff3d05a03124488')

build() {
	cd "${_perlmod}-${pkgver}"

	patch -Np1 -i ${srcdir}/destdir.patch

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor -l
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
