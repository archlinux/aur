# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-pdl-stats'
pkgver='0.83'
pkgrel='1'
pkgdesc="a collection of statistics modules in Perl Data Language, with a quick-start guide for non-PDL people."
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pdl')
url='https://metacpan.org/release/PDL-Stats'
source=("https://search.cpan.org/CPAN/authors/id/E/ET/ETJ/PDL-Stats-${pkgver}.tar.gz")
sha512sums=('1e6cc2c8fc6432087f591f0e1ae53e4212bbb301792029b093badac14346a4145ea1e768ed636be6bc83db89758eadf9ca9a5adfefd26c0fc91e9fd0feb6a04e')
_distdir="PDL-Stats-${pkgver}"

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
