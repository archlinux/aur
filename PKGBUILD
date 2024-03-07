# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-alien-cfitsio'
pkgver='4.4.0.1'
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
sha512sums=('29327be58b6cd7c0b415e9be4ef6504a5db4d54102e41a18f61d2566771e56482058b410dac2f5a63dc56d21a26e42078704686bd354e6c2f854a29baea13cde')
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
