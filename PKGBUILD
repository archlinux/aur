# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-alien-cfitsio'
pkgver='4.3.1.0'
pkgrel='1'
pkgdesc="Build and Install the CFITSIO library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'cfitsio' 'perl-alien-build')
makedepends=('perl-sort-versions')
checkdepends=('perl-test2-suite' 'perl-package-stash')
url='https://metacpan.org/dist/Alien-CFITSIO'
source=("https://cpan.metacpan.org/authors/id/D/DJ/DJERIUS/Alien-CFITSIO-v${pkgver}.tar.gz")
sha512sums=('1abf3f0d96887ce146f468bb44a5cdfd9504ff0e5bc5ef56f45f26e080785b0ed8dec7241b55f75e56037cd1bb3d4a3cf56a061140a5fa0bf116d435ac224a86')
_distdir="Alien-CFITSIO-v${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    export ALIEN_CFITSIO_ATLEAST_VERSION="$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
