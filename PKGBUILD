# Contributor: xRemaLx <anton.komolov@gmail.com>

pkgname='perl-test-www-mechanize'
_pkgname='Test-WWW-Mechanize'
pkgver='1.44'
pkgrel='2'
pkgdesc="Testing-specific WWW::Mechanize subclass"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.008' 'perl-carp-assert-more' 'perl-html-tree' 'perl-http-server-simple>=0.42' 'perl-libwww' 'perl-test-longstring>=0.15' 'perl-uri' 'perl-www-mechanize>=1.68')
makedepends=()
url='http://search.cpan.org/dist/Test-WWW-Mechanize'
source=("http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/${_pkgname}-${pkgver}.tar.gz")
md5sums=('fd3e4fe5b6adc66470752dd261d62542')
sha512sums=('ab6f8c210a42ef14cd83bc4644a338f76d2e0c908855fe4fbf03b2dc3376476e418b5e71a080cf889b0c6a8f20185def1b54568e1cb2ba130fe484516614393d')

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
