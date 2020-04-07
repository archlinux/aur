# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-rose-db-object
pkgver="0.817"
pkgrel='1'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-dbi>=1.40' 'perl-list-moreutils' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.763' 'perl-rose-object>=0.854' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
md5sums=('820de92a819e3c859392a04151ee4436')
sha512sums=('2e581e1769270793347641abf3fedb444445263614cfbf909e43b6401d20e7081b7d2755aaaac05c15acf05af469eac038c88d0197a1b2d8bf6cbaad4a1916e7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Rose-DB-Object-${pkgver}"
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
