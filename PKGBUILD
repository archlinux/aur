# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname="perl-audio-scan"
pkgver="1.01"
pkgrel="4"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=("i686" "x86_64" "arm")
license=("PerlArtistic" "GPL")
options=("!emptydirs")
depends=("zlib")
makedepends=("perl-test-warn")
url="http://search.cpan.org/dist/Audio-Scan"
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
sha512sums=('07e97bd1bb2c469d07c27e20bf2f3067967e21658493de012fcc4c083a0a0c42e36d6d8d5ae8d6f80d8b447d11fdea1c024ee7f4c3f857e565335328238e2853')

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
