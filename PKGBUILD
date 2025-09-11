# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-net-sip"
pkgver="0.839"
pkgrel='1'
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=("any")
license=("Artistic-2.0")
options=("!emptydirs")
depends=("perl-net-dns")
url="https://github.com/noxxi/p5-net-sip"
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('af1365115547d2715ea0b6c8dac8a6c7eb105bb80dd3ee72651aad48f00cfe83cf10418a3b7b1cd99cfdc79255c39adb15a95ee295be35d3b07e1915a2e03d90')

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
