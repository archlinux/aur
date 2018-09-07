# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-class-std'
pkgver='0.013'
pkgrel='1'
pkgdesc="Support for creating standard \"inside-out\" classes"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-module-build')
url='https://metacpan.org/release/Class-Std'
source=("https://cpan.metacpan.org/authors/id/C/CH/CHORNY/Class-Std-${pkgver}.tar.gz")
sha512sums=('10e0c23866753a82fc981931053fa786ba8c4fa6d90b18788220d7bb414886c567545b13a2e6a4db565b0a2be67ff6524bc1f22154a2fa1223dc0cdb5e05f109')

_prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Class-Std-${pkgver}"
}

build() {
  _prepare_environment
  /usr/bin/perl Makefile.PL
  make
}

check() {
  _prepare_environment
  make test
}

package() {
  _prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
