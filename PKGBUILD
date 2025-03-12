# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-email-filter"
pkgver="1.035"
pkgrel='3'
pkgdesc="Library for creating easy email filters"
arch=('any')
url="https://metacpan.org/dist/Email-Filter"
license=('Artistic-2.0')
depends=('perl-class-trigger' 'perl-email-localdelivery' 'perl-email-simple' 'perl-ipc-run')
makedepends=('perl-test-pod>=1.41')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RJ/RJBS/Email-Filter-${pkgver}.tar.gz")
sha512sums=('d8a699454e64989478445f3e15adbe4fbbcfa07e270b3237d65a6456d75ea5b636e92435b76acd4f9badbf948f11aa8d21257af61c90beb69c37aaafa2a82717')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Email-Filter-${pkgver}"
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
