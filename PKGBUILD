# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-gd-barcode"
pkgver="2.01"
pkgrel='1'
pkgdesc="Create barcode image with GD"
arch=('any')
url="https://metacpan.org/dist/GD-Barcode"
license=('Artistic-2.0')
depends=('perl-gd')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/M/MI/MICHIELB/GD-Barcode-${pkgver}.tar.gz")
sha512sums=('5e25e9effa1d7b56bd7086808e0bcc585f2842b2d46c349595ea3fae48cdab0b8c350752303548dbc640e0c4bdcce74c77f37732d634dd55e20f317d4bedaf79')

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
