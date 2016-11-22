# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-audio-scan'
pkgver="0.96"
pkgrel="1"
pkgdesc="Fast C metadata and tag reader for all common audio file formats"
arch=('i686' 'x86_64' 'arm')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'zlib>=1.2.5')
makedepends=('perl-test-warn')
url='http://search.cpan.org/dist/Audio-Scan'
source=("https://cpan.metacpan.org/authors/id/A/AG/AGRUNDMA/Audio-Scan-${pkgver}.tar.gz")
md5sums=('8f23f95577a3931e2da7442a4738493a')
sha512sums=('4a48da8195925ccd9e30e5febb9a048ca4a86f4ac15b1a9fff388cae7ebe380a61ff3f1c3cc2e5d95f5b3d099b583a3bdfa55b8af6a5e7c9bae70ba9b20fa62e')

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
