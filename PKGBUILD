# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname='perl-b-utils'
pkgver='0.27'
pkgrel='3'
pkgdesc="Helper functions for op tree manipulation"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken' 'perl-extutils-depends')
makedepends=('perl-test-reporter')
url='https://metacpan.org/release/B-Utils'
source=("https://cpan.metacpan.org/authors/id/E/ET/ETHER/B-Utils-${pkgver}.tar.gz")
sha512sums=('a896476f59a424fa9062c5dfe6431493c020e51746fa7f7b4c7fcdb109d1c0fa252292b891263d676884f064db95f16958a5d2ed5981dc5997436dced6579e74')


prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/B-Utils-${pkgver}"
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
  find "$pkgdir" '(' -name .packlist -o -name perllocal.pod ')' -delete
}
