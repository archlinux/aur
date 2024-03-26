# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-net-sip"
pkgver="0.836"
pkgrel="2"
pkgdesc="SIP (Voice Over IP, RFC3261) packet handling"
arch=("any")
license=("PerlArtistic")
options=("!emptydirs")
depends=("perl-net-dns")
url="https://github.com/noxxi/p5-net-sip"
source=("https://cpan.metacpan.org/authors/id/S/SU/SULLR/Net-SIP-${pkgver}.tar.gz"
        '5c18a54935955903ada55096115c347e08118a75.patch')
sha512sums=('a87096ffaac2c87f252f7d06524398341e5f3a674745fa7a1613aeb087d29edcb933c28fce750b0ce77f54a83a91c6ffea8c95743c97370368c4e83af98da8d9'
            '167074ffc428fc0a92b81779f527e0d7500a22eb97bce3a0bc00b4fd0c242ae01ca7b1a859dffcc61616ba80b5cb7827d0f8695620005ee5f33cedd1db10432d')

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

  patch -p1 < "$srcdir/5c18a54935955903ada55096115c347e08118a75.patch"

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
