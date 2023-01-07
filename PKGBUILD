# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-ppi-xs'
pkgver='0.910'
pkgrel='1'
pkgdesc="(Minor) XS acceleration for PPI"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-ppi>=1.000')
makedepends=()
url='https://metacpan.org/pod/PPI::XS'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/PPI-XS-${pkgver}.tar.gz")
sha512sums=('e4eb631cb6272bcb42acefe70ccb7fcf2c2fb34feabf16908de135df98b870ffc4b4d21fd705b5daeee76fe076478508391ccec9db764e9360ff523cfc1a777d')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/PPI-XS-${pkgver}"
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
