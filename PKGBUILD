# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-net-sip"
pkgver="0.838"
pkgrel="1"
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=("any")
license=("PerlArtistic")
options=("!emptydirs")
depends=("perl-net-dns")
url="https://github.com/noxxi/p5-net-sip"
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz")
sha512sums=('b6a99b6cba42f4c7d2b27d975ecba95638e6a936b113442df9fe9eab2c57460d7f7ef26514ddae0c33e898a74092e790b6f6c8493d34f06cd2fe8ca6dc1c10e7')

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
