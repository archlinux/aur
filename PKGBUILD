# lMaintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-cpan-meta-check'
pkgver='0.012'
pkgrel="1"
pkgdesc="Verify requirements in a CPAN::Meta object"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-test-deep')
url='http://search.cpan.org/dist/CPAN-Meta-Check'
source=("https://cpan.metacpan.org/authors/id/L/LE/LEONT/CPAN-Meta-Check-${pkgver}.tar.gz")
md5sums=('adb415398390e83f09e4b91f73a6fd7f')
sha512sums=('99ec6721dfb6be8fae7e5a4f6418d4d12d8d093df11f0596480ecc19a46ef3af3fc3da91ccdd7110f974e8f4d04e33166d76804b673a019bc4994f96b7078e7d')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/CPAN-Meta-Check-${pkgver}"
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
