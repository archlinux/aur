# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-sslglue
pkgver=1.055
pkgrel="1"
pkgdesc="Adds/extends SSL support for common Perl modules"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Net-SSLGlue/"
depends=('perl-io-socket-ssl>=1.19')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-SSLGlue-${pkgver}.tar.gz)
md5sums=('7436f07926c7357e1437dbe5d1251bc2')
sha512sums=('18a495cf4ccc34c69d81e59c1e03a5d5a55d7626ed140af76d3082e71b3eef2a97657afe2aab09d838d41004a65639d42a5ef2411f46866208af8c8eb4b01d4c')

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
