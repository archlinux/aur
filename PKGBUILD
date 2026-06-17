# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname="perl-audio-scan"
pkgver="1.13"
pkgrel='1'
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=("i686" "x86_64" "arm")
license=("GPL-2.0-or-later")
options=("!emptydirs")
depends=("zlib")
makedepends=("perl-test-warn")
url="https://metacpan.org/dist/Audio-Scan"
source=("https://cpan.metacpan.org/authors/id/E/EL/ELBRUS/Audio-Scan-${pkgver}.tar.gz")
sha512sums=('0c30cccce83b57d3c0cd64cfd3c905c70a385180ec4eb91ca78ac094ee9e01fb21a6a648e263952ceffbec1cff5bb416f44b4d9f9111c4765952fdf0f0a9796e')

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
  find "$pkgdir" -type f -name '*.so' -exec strip {} \+ # 'strip' option doesn't work because files are read-only
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
