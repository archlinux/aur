# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-rose-db-object"
pkgver="0.821"
pkgrel='1'
pkgdesc="Extensible, high performance object-relational mapper (ORM)"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Rose-DB-Object/"
depends=('perl-bit-vector' 'perl-clone>=0.29' 'perl-datetime' 'perl-datetime-timezone' 'perl-dbi>=1.40' 'perl-list-moreutils-xs' 'perl-rose-datetime>=0.532' 'perl-rose-db>=0.782' 'perl-rose-object>=0.854' 'perl-scalar-list-utils' 'perl-time-clock>=1.00')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/J/JS/JSIRACUSA/Rose-DB-Object-${pkgver}.tar.gz")
sha512sums=('7266ccfb73a38f3d83ad626b12edd184a79ef122a7c1d2909be11dbc500e55562f0628a1c66673530efe3399f8b4f0979b0418c6c45963ee8522c49ebddbd1d7')

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
