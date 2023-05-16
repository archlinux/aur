# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-alien-cfitsio'
pkgver='4.2.0.0'
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
sha512sums=('14fb13b9b8867209a1c613767692d8d42af84d0a76654b38fcd16b5d3fede3114019d09035f1ebd246328b7906bd1f88cfbe3c196c677ee6a809b69bf482bdec')
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
