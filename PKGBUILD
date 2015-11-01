# CPAN Name : FindBin-libs
# Maintainer: Rafael Reggiani Manzo <rr.manzo@gmail.com>
# Template  : CPANPLUS::Dist::Arch

pkgname=perl-findbin-libs
pkgver=2.15
pkgrel=1
pkgdesc="locate and a 'use lib' or export directories based on $FindBin::Bin."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
url='http://search.cpan.org/~lembark/FindBin-libs-2.15/lib/FindBin/libs.pm'
_distdir="FindBin-libs"
source=("http://search.cpan.org/CPAN/authors/id/L/LE/LEMBARK/$_distdir-$pkgver.tar.gz")
sha512sums=('b97c09e490a170388c5f835ff3c9590eb038edf816dbfe78cc2ca31689cbd56dd12fcba49f158aadcf5928b44e50c6ffe7949058434e3d028f43f9a6a589c3de')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir-$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
