# Maintainer: András Wacha < awacha at gmail >
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-astro-fits-cfitsio'
pkgver='1.18'
pkgrel='2'
pkgdesc="Perl extension for using the cfitsio library"
arch=('i686' 'x86_64')
license=('Artistic-1.0-Perl' 'GPL-1.0-or-later')
options=('!emptydirs')
depends=('perl' 'glibc' 'cfitsio')
makedepends=('perl-alien-cfitsio')
checkdepends=('perl-test2-suite')
url='https://metacpan.org/release/Astro-FITS-CFITSIO'
source=("https://search.cpan.org/CPAN/authors/id/P/PR/PRATZLAFF/Astro-FITS-CFITSIO-${pkgver}.tar.gz")
sha512sums=('25eeac3d50af1e8866967edf26ba0c7d4560e5a414775588efa7587ccef4756937a23e2f2370eaa8211b5626db583b732b9be7e6e54debe86e174ac978d35bb4')
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
