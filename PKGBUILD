# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-net-sslglue
pkgver=1.054
pkgrel="1"
pkgdesc="Adds/extends SSL support for common Perl modules"
arch=(any)
license=('PerlArtistic')
url="http://search.cpan.org/dist/Net-SSLGlue/"
depends=('perl-io-socket-ssl>=1.19')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-SSLGlue-${pkgver}.tar.gz)
md5sums=('24d2a830169f2bab7dad08daa0f1922f')
sha512sums=('33f4920a623ba8af8ed181cf8b2c80c2a7f27dcbc6899ea3f243536b152d36dcf21b91bfba1b4bea079e2c064ad793d2d8a6d5d360c734a635b8a081f36b5668')

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
