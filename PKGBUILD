# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname="perl-audio-scan"
pkgver="0.99"
pkgrel="1"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=("i686" "x86_64" "arm")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("zlib")
makedepends=("perl-test-warn")
url="http://search.cpan.org/dist/Audio-Scan"
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
sha512sums=('abbf51c9eb15336527500ac9ce6dd8e05baee6dabdf2a4bc95a62b1787fe24c4ad0abb07d5632647e4add3123a3cfe6374c6fbfd236c5b01c3350b6ee9d74b10')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Audio-Scan-${pkgver}"
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
