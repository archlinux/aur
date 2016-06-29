# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db
pkgver="0.778"
pkgrel="1"
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
sha512sums=('85fa077c764f513f2af295c29251280a0e9eceb186380ceaf2746c8de2744d25b93a631c498bb5d581fc7d9bc5353cce5339647be075b015828d8a2d3f59c1c6')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
