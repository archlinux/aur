# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-template-timer'
_pkgname='Template-Timer'
pkgver='1.00'
pkgrel='3'
pkgdesc="Rudimentary profiling for Template Toolkit"
arch=('any')
url='http://search.cpan.org/dist/Template-Timer'
license=('PerlArtistic' 'GPL')
depends=('perl' 'perl-template-toolkit')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b9aa5f2f2d7034b0a62bb670afc6711ec7d49aff84cd948ea09d6c55d9b8b2aeb7606150ed0bea5402ba63761fd03ee6fce402598ef82a8235fb8b50c2ba4f43')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/${_pkgname}-${pkgver}"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
