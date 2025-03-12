# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-datetime-format-mysql
pkgver='0.08'
pkgrel='3'
pkgdesc="Parse and format MySQL dates and times"
arch=("any")
license=('GPL-1.0-or-later' 'Artistic-2.0')
url="https://metacpan.org/pod/DateTime::Format::MySQL"
options=(!emptydirs)
depends=('perl-datetime' 'perl-datetime-format-builder')
makedepends=('perl-module-build')
source=("https://cpan.metacpan.org/authors/id/X/XM/XMIKEW/DateTime-Format-MySQL-${pkgver}.tar.gz")
sha512sums=('55ef89a12e13abfe4f95f82bd7a5ff6a53e2d96be7360c0ccbbd5fed8b20037d3c950fe005c4b81f2b78820381681cbd92d1e0d8a64f30938791b90ec4116662')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/DateTime-Format-MySQL-${pkgver}"
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
