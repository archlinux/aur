# CPAN Name : Test-File
# Maintainer: Bruno Dupuis <lisael@lisael.org>
# Contributor: Rafael Reggiani Manzo <rr.manzo@gmail.com>
# Template  : CPANPLUS::Dist::Arch

pkgname=perl-test-file
pkgver=1.443
pkgrel=1
pkgdesc="This modules provides a collection of test utilities for file attributes."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=(perl-test-utf8)
makedepends=()
url='http://search.cpan.org/~bdfoy/Test-File-1.443/lib/Test/File.pm'
_distdir="Test-File"
source=("http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/$_distdir-$pkgver.tar.gz")
sha512sums=('9ad66b3a9dc1c3752a4ec22934db9139ac010ac3237a3de018d4ec4a65ac047f0152ab9e7979a2615412c1af02a1f2dfa0dbfdf5eba5358628b1b443232c45b2')

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
