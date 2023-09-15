# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-gd-barcode"
pkgver="2.00"
pkgrel='1'
pkgdesc="Create barcode image with GD"
arch=('any')
url="http://search.cpan.org/dist/GD-Barcode"
license=('GPL' 'PerlArtistic')
depends=('perl-gd')
makedepends=('perl-test2-suite>=0.000060')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MICHIELB/GD-Barcode-${pkgver}.tar.gz")
sha512sums=('75ccaab47791e4d00dde058cd3914edd9b907760d4a007c6a26fbe664d7a14ba55981a345bae70b5d7f3d63589e0eaee4061753b9aba2b596a412b3fa5aeb67c')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/GD-Barcode-${pkgver}"
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
