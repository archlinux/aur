# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-context-preserve'
pkgver='0.03'
pkgrel='3'
pkgdesc="run code after a subroutine call, preserving the context the subroutine would have seen if it were the last statement in the caller"
arch=('any')
license=('Artistic-2.0' 'GPL-1.0-or-later')
options=('!emptydirs')
makedepends=('perl-test-exception')
url='https://metacpan.org/dist/Context-Preserve'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/Context-Preserve-${pkgver}.tar.gz")
sha512sums=('a5f412d553ba2ded7302f594b920bd9c04021c5ec60e94939da097a0fa2de61a0b49dd864e3212eb9b3a7d5236295e1923452e81d56789ae6852c73ec3086cea')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Context-Preserve-${pkgver}"
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
