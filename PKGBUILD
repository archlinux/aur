# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Rafael Reggiani Manzo <rr.manzo@gmail.com>

pkgname=perl-findbin-libs
pkgver=3.0.2
pkgrel=1
pkgdesc="locate and a 'use lib' or export directories based on $FindBin::Bin."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-file-copy-recursive-reduced')
url='https://metacpan.org/dist/FindBin-libs'
_distdir="FindBin-libs"
source=("https://cpan.metacpan.org/authors/id/L/LE/LEMBARK//$_distdir-v$pkgver.tar.gz")
sha512sums=('7ea749f70189b9927b51919b7d537fbd25004aec6f397f77f78d6a8d1481e60b837c35998874e5851131c8f6e5b1af78ad93d1565f1f36e6e773aec1f779a36f')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir-v$pkgver"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir-v$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir-v$pkgver"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
