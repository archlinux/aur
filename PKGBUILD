# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-alien-cfitsio'
pkgver='4.1.0.5'
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
sha512sums=('f0b3fcec0051d019b82d52900b0ee478fd73933b90bb7ae6d7b39ffad50097ba1e989372253fc28f7e44f7eada7ccd08e8dd0753a5364bd28f4456bfaf521a7e')
_distdir="Alien-CFITSIO-v${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
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
