# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db
pkgver="0.787"
pkgrel='1'
pkgdesc="A DBI wrapper and abstraction layer"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/Rose-DB"
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
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-${pkgver}.tar.gz")
sha512sums=('138de42f15243c483e5fbab928189d094b6f763c9530b8cd6f0a139ad3ec8109aefaad1100cb293cf689598443b360a9c109b2d44adbdeb1e82c5dc857655e00')

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
