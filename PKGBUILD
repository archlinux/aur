# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-audio-scan'
pkgver="0.98"
pkgrel="2"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/Audio-Scan'
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
sha512sums=('58b30c0a4c0ec2a8612d846e9fe2680444ce745d60c3670f22686c0283245904f0506e3e362767493ad5f4aa28cebd685d12e87db3a7644edc31e2633d7342f2')

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
