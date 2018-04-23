# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname="perl-audio-scan"
pkgver="1.00"
pkgrel="1"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=("i686" "x86_64" "arm")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("zlib")
makedepends=("perl-test-warn")
url="http://search.cpan.org/dist/Audio-Scan"
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
sha512sums=('de05aa38f49f085db3f7b4c0278dc7e08282fbd3a9441343416dcdbe5b1999d4d79c617fbc70edfa579cb80f4131705aa3e9203e61f7f6ea1b4dac8f8d5ac8f2')

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
