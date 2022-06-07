# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-math-derivative'
pkgver='1.01'
pkgrel='3'
pkgdesc="Numeric 1st and 2nd order differentiation"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'perl-math-utils')
makedepends=()
checkdepends=('perl-test-pod')
url='https://metacpan.org/release/Math-Derivative'
source=("http://search.cpan.org/CPAN/authors/id/J/JG/JGAMBLE/Math-Derivative-${pkgver}.tar.gz")
md5sums=('6672c09e229f74cd115c3f028b1522cb')
sha512sums=('8fb13bb64b205892f39ba732f864010971cb08eef26987e9ef31e43c2b0eae2758992cbb719d38cbbb0858c0e55067a0d009322e65f31817d713a84d157e7805')
_distdir="Math-Derivative-${pkgver}"

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
