# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-sslglue
pkgver='1.057'
pkgrel='1'
pkgdesc="Adds/extends SSL support for common Perl modules"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Net-SSLGlue/"
depends=('perl-io-socket-ssl>=1.19')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-SSLGlue-${pkgver}.tar.gz)
sha512sums=('6b3bc59ec3daf219c16b597669384d31d3a8628770107193cc6e8be0f5e9b82706a30126b6351035fd774c7992b4d88874579628073b90897fe991af3d1e9fa7')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
