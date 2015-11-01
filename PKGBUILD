# Submitter  : gergan_penkov
# Maintainer : gergan_penkov
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-exception-base'
pkgver='0.25'
pkgrel='1'
pkgdesc="Lightweight exceptions"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
checkdepends=('perl-test-unit-lite>=0.12')
url='https://metacpan.org/release/Exception-Base'
source=(
  'http://search.cpan.org/CPAN/authors/id/D/DE/DEXTER/Exception-Base-0.25.tar.gz'
  '1cb0ea6afd4bb76e5a1d759efe27ea0f18306a82.patch'
  )
md5sums=('7aad69250044146a641fe34a2f8642dd'
         'f6ed882c1e64667481be4896cbb58a2e')
sha512sums=('4bc416a8a4096b2149a205dc3129aabaa49bfa9f29746b31a09cbade01e15d53ed82649b75d69c508568a7fb12726e319360aba128102fdc1e0a7ba583473e65'
            '9ab05259c0de820d3bd4fe71774ac5874d3199ccd55e3daf22e672b30344b2ecbe4dcb3ed83bc1e2fba6f751836018f2b856c95506057856c739611f9774f917')
_distdir="Exception-Base-0.25"

prepare() {
  cd "${srcdir}"/Exception-Base-${pkgver}
  patch -p1 -i ../1cb0ea6afd4bb76e5a1d759efe27ea0f18306a82.patch
}
build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
