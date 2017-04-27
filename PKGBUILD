# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-audio-scan'
pkgver="0.97"
pkgrel="1"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/Audio-Scan'
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
md5sums=('77f8cfe9337e7a798930b86adc49a3b3')
sha512sums=('d48d405a995c8538f0480ae9283dbf63c165db2a672cd0fcb968c682f43be07d684012616589a6a0682491875f3d449e6bf38fa52830442e6bc8c38cdb26b0ae')

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
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
