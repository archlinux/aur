# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-test-synopsis'
pkgver='0.16'
pkgrel='1'
pkgdesc="Test your SYNOPSIS code"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="https://metacpan.org/pod/Test::Synopsis"
source=("https://cpan.metacpan.org/authors/id/Z/ZO/ZOFFIX/Test-Synopsis-${pkgver}.tar.gz")
sha512sums=('eacd83013ce6ebf2ccebc3d32bf5415b03b934191e6e13713608262c18cc2dc338d78013e0045f9584413a959d70b0484b21045b03d72d1e2bd022a6809c956c')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Test-Synopsis-${pkgver}"
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
