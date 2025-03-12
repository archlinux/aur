# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-test-mock-lwp-dispatch'
pkgver='0.08'
pkgrel='3'
pkgdesc="mocks LWP::UserAgent and dispatches your requests/responses"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl-libwww' 'perl-test-mockobject')
makedepends=('perl-test-exception')
url='https://metacpan.org/release/Test-Mock-LWP-Dispatch'
source=("https://cpan.metacpan.org/authors/id/T/TA/TADAM/Test-Mock-LWP-Dispatch-${pkgver}.tar.gz")
md5sums=('2bcefcace7dd714183afc11244440b7c')
sha512sums=('419e9410c4f86dd7fe669ab09ca5c17dd4a2d9ab9fa36647f8e95702ee7e3b66a36692acc72c03e128553f5289b8d6260e7449061e9009d911d6db406c2d6876')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
