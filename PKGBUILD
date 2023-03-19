# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-alien-gnuplot
pkgver=1.041
pkgrel=1
pkgdesc="Find and verify functionality of the gnuplot executable."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'gnuplot')
makedepends=('perl-alien-build')
checkdepends=('perl-test-exception')
url='https://metacpan.org/dist/Alien-Gnuplot'
_distdir="Alien-Gnuplot"
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_distdir-$pkgver.tar.gz")
sha512sums=('1ef7c91217d5f613b75e2d2e5df1d97c2ab77526d4325b8decb9d9198a49c8c5e6cfb15196c84ba4be79fc122240bc5bf61d8aeb3c20dc8bab0dbc9cc84d3f95')

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
