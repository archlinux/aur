# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-test-mock-lwp-dispatch'
pkgver='0.06'
pkgrel='3'
pkgdesc="mocks LWP::UserAgent and dispatches your requests/responses"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww' 'perl-test-mockobject')
makedepends=('perl-test-exception')
url='https://metacpan.org/release/Test-Mock-LWP-Dispatch'
source=("http://cpan.metacpan.org/authors/id/T/TA/TADAM/Test-Mock-LWP-Dispatch-${pkgver}.tar.gz")
md5sums=('601e663c1900c08b6f28ef27123e9eee')
sha512sums=('ec0f81e6c91881f80b3c3e0fdf0618fbefd5fff8fc5cc8604b000b699103ba991b49206ecb2c47a9b59edeb9495e6166a069ba02ba3d3ea8ed11a5c84b5d1878')

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
