# Generator  : CPANPLUS::Dist::Arch 1.32
# Maintainer: András Wacha < awacha at gmail >

pkgname='perl-math-random'
pkgver='0.72'
pkgrel='1'
pkgdesc="Random Number Generators"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0' 'glibc>=2.24')
makedepends=()
url='https://metacpan.org/release/Math-Random'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GROMMEL/Math-Random-0.72.tar.gz')
md5sums=('b0b961e2ae06920801a9c9843c48d0bc')
sha512sums=('6a24f59ba06b93027fe5907d41a36b2142c20c2813813a34a5adfa9ee06de25902d5f544009f307b518905c614238f63ad3717a1f199513f455f4c53119e2088')
_distdir="Math-Random-0.72"

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
