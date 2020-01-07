# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db
pkgver="0.781"
pkgrel='1'
pkgdesc="A DBI wrapper and abstraction layer"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB/"
depends=(
  'perl-bit-vector>=6.4'
  'perl-clone-pp'
  'perl-datetime'
  'perl-datetime-format-mysql'
  'perl-datetime-format-oracle'
  'perl-datetime-format-pg>=0.11'
  'perl-dbi'
  'perl-rose-datetime>=0.532'
  'perl-rose-object>=0.854'
  'perl-sql-reservedwords'
  'perl-time-clock'
)
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/J/JS/JSIRACUSA/Rose-DB-${pkgver}.tar.gz)
sha512sums=('c54c53b4e4e7af43cd55c2fcfd0e5a080e326b40fbba92f5235fa8b69cf8baec826edeb7183db34e51505f3ec30b4054567ba0b809910934edd9a84274f1faf7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Rose-DB-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}
