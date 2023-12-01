# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db
pkgver="0.785"
pkgrel='2'
pkgdesc="A DBI wrapper and abstraction layer"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB/"
depends=(
  'perl'
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
sha512sums=('9fda0393e79201e5301b16eb45b456db48080fe3cbbef6d6d7d36f761fcc20f2a2a1bc6f8b326125e06fd0e34de3648715b3cf9fb032543f008b631aef711cac')

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
