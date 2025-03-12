# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-sslglue
pkgver='1.058'
pkgrel='3'
pkgdesc="Adds/extends SSL support for common Perl modules"
arch=(any)
license=('Artistic-2.0')
url="https://metacpan.org/dist/Net-SSLGlue"
depends=('perl-io-socket-ssl>=1.19')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-SSLGlue-${pkgver}.tar.gz)
sha512sums=('7c4150e1d9e4cf75108f4ed53f8913717649b6697e2ccb6977ee76dfa965fbb2e84f08be99bf495ad23630e7cf4273a30d25f37d9385c8af98f37e2ff7cf8dee')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/Net-SSLGlue-${pkgver}"
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
