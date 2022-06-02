# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname='perl-pdl-stats'
pkgver='0.82'
pkgrel='1'
pkgdesc="a collection of statistics modules in Perl Data Language, with a quick-start guide for non-PDL people."
arch=('x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-pdl')
url='https://metacpan.org/release/PDL-Stats'
source=("https://search.cpan.org/CPAN/authors/id/E/ET/ETJ/PDL-Stats-${pkgver}.tar.gz")
sha512sums=('9c4f165e7ae60e271b37de5c10d84a344ca2a9281d8f75ddebe1b7d44921082174919619f58cb4cebc8ab88e21d17e82de74124bc5924b9b8dcfaf3a22e217c8')
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
