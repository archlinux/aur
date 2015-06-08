# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-carp-assert-more'
_pkgname='Carp-Assert-More'
pkgver='1.14'
pkgrel='2'
pkgdesc="convenience wrappers around Carp::Assert"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Carp-Assert-More'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz")
md5sums=('78d85249929273259e0a519925b80cd9')
sha512sums=('0411908afd5cc45cedce83fb10e67f78f7513fa788421d9c4e0f0f0064bf6fdd7154c2414a449456ff4c600f31eba138fb4d3f94e68743af4b71f7368c30b398')

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
