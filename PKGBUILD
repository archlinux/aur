# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-audio-scan'
pkgver='0.93'
pkgrel="7"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'zlib>=1.2.5')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/Audio-Scan'
source=('http://search.cpan.org/CPAN/authors/id/A/AG/AGRUNDMA/Audio-Scan-0.93.tar.gz')
md5sums=('afcdbf8641e1a572a387fe097e3897ee')
sha512sums=('1e82f8ff35744a14626777450c87e15d7f0e5ada7f6643c5f9b38a599068cacef50ae83b525292440085de4593ad625abf5ee61282b59f64b1349d5d8f29e99a')

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
