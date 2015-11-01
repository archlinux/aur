# CPAN Name : Test-File
# Maintainer: Rafael Reggiani Manzo <rr.manzo@gmail.com>
# Template  : CPANPLUS::Dist::Arch

pkgname=perl-test-file
pkgver=1.44
pkgrel=1
pkgdesc="This modules provides a collection of test utilities for file attributes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
url='http://search.cpan.org/~bdfoy/Test-File-1.44/lib/Test/File.pm'
_distdir="Test-File"
source=("http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/$_distdir-$pkgver.tar.gz")
sha512sums=('428b4027ba8a20fcf92dedb1c1a9ca9866bb41b679f78a7640fee1e0c60c9daa77713e41995b3cba9a271a4df538985276df34ea649efef8592896eade96cb89')

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
