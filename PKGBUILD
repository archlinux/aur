# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-rose-db-object"
pkgver="0.820"
pkgrel='1'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-datetime-timezone' 'perl-dbi>=1.40' 'perl-list-moreutils-xs' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.782' 'perl-rose-object>=0.854' 'perl-scalar-list-utils' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
md5sums=('2f2573aa36c51ae9c6bdd9b3fa71e7aa')
sha512sums=('89de965ac7cfadc4d6c247a51b5fd0b763b907ce384132bccf90eb3619a1f516db290dbc0ce8c9ef6a4db31eb23ad16d49324853ff075eb99c67b3ef030bc397')

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
