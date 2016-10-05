# Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-net-sip'
pkgver='0.687'
pkgrel='1'
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=('any')
license=('PerlArtistic')
options=('!emptydirs')
depends=('perl-net-dns')
url='http://search.cpan.org/dist/Net-SIP'
source=("http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('3356e4662eb931f5cbbf611cd9ad88e17bfd4b6a05b882062d7410829e48c4f0de323451da2a9e422f37ef207716ccc6dd5d3e465289b39bfe5cd8f0957e3f4f')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Net-SIP-${pkgver}"
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
