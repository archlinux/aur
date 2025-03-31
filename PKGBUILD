# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-sys-sigaction'
pkgver='0.24'
pkgrel='1'
pkgdesc="Perl extension for Consistent Signal Handling"
arch=('any')
license=('Artistic-2.0')
options=('!emptydirs')
depends=('perl')
makedepends=()
url="https://metacpan.org/pod/Sys::SigAction"
source=("https://cpan.metacpan.org/authors/id/L/LB/LBAXTER/Sys-SigAction-${pkgver}.tar.gz")
sha512sums=('80162f1c8d67110863570b0d591502cef9a2f4ce5131f1eac69603a7d8b0b9fd0277c198c81c96ab786f2150641b25c3232d65ac01580525dfc5ec03535059a4')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Sys-SigAction-${pkgver}"
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
