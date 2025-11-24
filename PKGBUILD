# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname='perl-chemistry-elements'
pkgver='1.081'
pkgrel='1'
pkgdesc="Perl extension for working with Chemical Elements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/Chemistry-Elements'
source=("https://search.cpan.org/CPAN/authors/id/B/BR/BRIANDFOY/Chemistry-Elements-${pkgver}.tar.gz")
sha512sums=('9accd145e7681a031dd2a52cd24f46e90379a19b1c0fcbf0b20b866b25b74e9e5ba180f85ed32382b84e8d86edc74a534a735708537a52cfdec4d93e73562c33')
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
