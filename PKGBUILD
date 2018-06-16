# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-net-sip"
pkgver="0.815"
pkgrel="1"
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=("any")
license=("PerlArtistic")
options=("!emptydirs")
depends=("perl-net-dns")
url="http://search.cpan.org/dist/Net-SIP"
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('ca75a1442c52d162ff156bb0248f9dcbcc4a7766c5c784eee16048b9cc2ddc26c708b2bb372fb0bfbdd326dd58294753319bd50ce13289157bfc20e6aead73e6')

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
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
