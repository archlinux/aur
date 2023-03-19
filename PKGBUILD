# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='perl-chemistry-elements'
pkgver='1.075'
pkgrel='3'
pkgdesc="Perl extension for working with Chemical Elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/Chemistry-Elements'
source=("https://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Chemistry-Elements-${pkgver}.tar.gz")
sha512sums=('fb310ed3b8d2185da06487b777b5a912175628ddc0d803a9e9225ab308aad87586e4986868da7c0c3f8314fb10b63a9f7cb6ae0fdc354c13d5515112fd08f3d2')
_distdir="Chemistry-Elements-${pkgver}"

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
