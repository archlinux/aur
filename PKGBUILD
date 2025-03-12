# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-test-synopsis'
pkgver='0.17'
pkgrel='2'
pkgdesc="Test your SYNOPSIS code"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="https://metacpan.org/pod/Test::Synopsis"
source=("https://cpan.metacpan.org/authors/id/Z/ZO/ZOFFIX/Test-Synopsis-${pkgver}.tar.gz")
sha512sums=('2ddd25cab88c11794f50d974900e2a1c2af2b903226dcaf774de5ba37035f46276eaad6c5d5ed64f896aacd24ccc02b423ec6a59dc1f2e04f21a55a25f28df0b')

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
