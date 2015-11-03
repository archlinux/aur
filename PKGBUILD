# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-test-mock-lwp-dispatch'
pkgver='0.07'
pkgrel='1'
pkgdesc="mocks LWP::UserAgent and dispatches your requests/responses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-test-mockobject')
makedepends=('perl-test-exception')
url='https://metacpan.org/release/Test-Mock-LWP-Dispatch'
source=("https://cpan.metacpan.org/authors/id/T/TA/TADAM/Test-Mock-LWP-Dispatch-${pkgver}.tar.gz")
md5sums=('a41c1924bf6b01b69ecea160a9df7d9d')
sha512sums=('2acc8839d82b666d183fb429cec6449b66e44116a9ba19947289f274399e034db4da115b0a88971c17f995bb64bf1af19d7f5d0e545ab89790d4201bdd33c5d7')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Test-Mock-LWP-Dispatch-${pkgver}"
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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
