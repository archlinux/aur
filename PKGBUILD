# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db
pkgver=0.777
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
md5sums=('80f6550fefb1f1ac08fe904550753b48')
sha512sums=('01668905c1beb4ce8a68b11aefb330d1eff33e074282d76da0151b70facad458414878fb82a44942f6ee30dd2b7e58afd3f5a5b90ef3d667bd3e906b0c4dfffc')

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
