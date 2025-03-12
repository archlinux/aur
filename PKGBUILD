# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-rose-db-object"
pkgver="0.822"
pkgrel='2'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/Rose-DB-Object"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-datetime-timezone' 'perl-dbi>=1.40' 'perl-list-moreutils-xs' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.782' 'perl-rose-object>=0.854' 'perl-scalar-list-utils' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
sha512sums=('ec466606dacf68c3157d9e1d8f32df62acc284055de0c9ab43e6ba5b240ea8e26dec12851148847b6eeef2dc46370430263bddd86d9b99d3cc46922bdd29b753')

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
