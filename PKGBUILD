# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-lwp-useragent-cached'
pkgver='0.06'
pkgrel='1'
pkgdesc="LWP::UserAgent with simple caching mechanism"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-libwww')
makedepends=('perl-test-mock-lwp-dispatch>=0.02')
url='https://metacpan.org/release/LWP-UserAgent-Cached'
source=("http://cpan.metacpan.org/authors/id/O/OL/OLEG/LWP-UserAgent-Cached-${pkgver}.tar.gz")
md5sums=('2dd2ec330ee13d87ae50c7a30f12c99e')
sha512sums=('151d2e145f768fda950c718b0f00aca946797328968c67b689af2dbc48546b66040f108bd03aac52bb12bd7cea569f1332a787e0899ea4c0b91753de2aea996e')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/LWP-UserAgent-Cached-${pkgver}"
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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
