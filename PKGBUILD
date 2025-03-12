# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-convert-nlsdateformat
pkgver="0.06"
pkgrel='4'
pkgdesc="Convert Oracle NLS_DATE_FORMAT to/from strftime format strings"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/Convert-NLS_DATE_FORMAT"
options=('!emptydirs')
makedepends=('perl-module-build-tiny')
source=("https://cpan.metacpan.org/authors/id/K/KO/KOLIBRIE/Convert-NLS_DATE_FORMAT-${pkgver}.tar.gz")
md5sums=('6224b6bb3c112cc525c970fd2af606aa')
sha512sums=('ac2d0f9c1cce14016e7212bc6c2e9e017a1267ff6d5a9d7a08c02ec6ad8c480f76544fe723f2a338c2d1033d144a36d53d275557f9811e9a8d87e91d9d744358')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Convert-NLS_DATE_FORMAT-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  prepare_environment
  ./Build test
}

package() {
  prepare_environment
  ./Build install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
