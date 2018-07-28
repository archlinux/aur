# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-carp-assert-more'
_pkgname='Carp-Assert-More'
pkgver='1.16'
pkgrel='1'
pkgdesc="convenience wrappers around Carp::Assert"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-carp-assert')
makedepends=('perl-test-exception')
url='http://search.cpan.org/dist/Carp-Assert-More'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('9f81604574eab5a0a5003ad747ffec3a3dd33bc63e67d12697e4e30de8cb234a73e225f82a4d0f31576e19382cc2d6a402962f5fe1e4c5289e080ca23b30c0fe')

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
