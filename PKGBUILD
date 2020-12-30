# Maintainer: Amish <contact at via dot aur>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-text-csv-xs
pkgver=1.45
pkgrel=1
pkgdesc="Comma-separated values manipulation routines"
_dist=Text-CSV_XS
arch=('i686' 'x86_64')
url="https://metacpan.org/release/${_dist}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/H/HM/HMBRAND/${_dist}-${pkgver}.tgz")
sha512sums=('ef95ed126541baa519c895394b52659a8173bd4c3c2ebb4843cef4129c1bfd220942823861bfa77ddaaec014914eb3c5677eb0e6131ce6526f0da87d93d1790f')

build() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_dist}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
