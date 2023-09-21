# Contributor: Jameson Pugh <imntreal@gmail.com.

pkgname='perl-soap-wsdl'
pkgver='3.004'
pkgrel='1'
pkgdesc="SOAP with WSDL support"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-xml-parser' 'perl-term-readkey' 'perl-class-std-fast'
'perl-class-load' 'perl-template-toolkit')
checkdepends=('perl-cgi' 'perl-test-pod' 'perl-soap-lite' 'perl-test-mockobject')
url='https://metacpan.org/pod/SOAP::WSDL'
source=("https://cpan.metacpan.org/authors/id/S/SW/SWALTERS/SOAP-WSDL-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/SOAP-WSDL-${pkgver}"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# vim:set ts=2 sw=2 et:
sha256sums=('e2cc1e42eace8dbb384e509d04644191afcdd8df0fec144376cebafad3f15744')
