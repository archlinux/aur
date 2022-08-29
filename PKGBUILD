# Maintainer: András Wacha < awacha at gmail >
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-astro-fits-cfitsio'
pkgver='1.16'
pkgrel='1'
pkgdesc="Perl extension for using the cfitsio library"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'glibc' 'cfitsio')
makedepends=('perl-alien-cfitsio')
url='https://metacpan.org/release/Astro-FITS-CFITSIO'
source=("https://search.cpan.org/CPAN/authors/id/P/PR/PRATZLAFF/Astro-FITS-CFITSIO-${pkgver}.tar.gz")
sha512sums=('51d0d6355a243671a105d7637196a4262631fbc60386724952e43d2d97680528011b976101d75ef3ea7f3004118703f9d98488045d78484d8de925e4c92d4c8e')
_distdir="Astro-FITS-CFITSIO-${pkgver}"

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

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
