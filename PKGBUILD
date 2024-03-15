# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-alien-cfitsio'
pkgver='4.4.0.2'
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
sha512sums=('5b688f0d1c94c678c7ed0e29896db229d94eb252ffd11437c3edcb60ef2a72ec781bae37130acc50eb491cb50846fc9b12ee5539fb94e169cbae8a13af0f6b2a')
_distdir="Alien-CFITSIO-v${pkgver}"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    export ALIEN_CFITSIO_ATLEAST_VERSION="${pkgver::5}"
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
