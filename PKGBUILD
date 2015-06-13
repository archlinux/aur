# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-data-page'
pkgver='2.02'
pkgrel="3"
pkgdesc="help when paging through sets of results"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-class-accessor-chained' 'perl-test-exception')
url='http://search.cpan.org/dist/Data-Page'
source=('http://search.cpan.org/CPAN/authors/id/L/LB/LBROCARD/Data-Page-2.02.tar.gz')
md5sums=('57f9aed8a79687a2712adf7bf2f9cc4d')
sha512sums=('22b5b8b80672bfd20a1552ee9d41e5150262eb37be6d903d67465be472d1802668ac898b9172b76fe2747f25ff9ad2025257b215f763f2ba5793abb46eb2343f')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Data-Page-${pkgver}"
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
