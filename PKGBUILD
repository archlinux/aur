# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-string-interpolate-named
pkgver=1.00
pkgrel=1
pkgdesc="Interpolated named arguments in string"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url='https://metacpan.org/release/String-Interpolate-Named'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/String-Interpolate-Named-1.00.tar.gz')
sha512sums=('81e03c05bc2cd32bf44272d45ee8159c12f6515feea37556e29a55e99ae013aa7b87c445c87dc41288106fbf87a90f646e72f3d46f2c92efa128f3564968df09')
_distdir="String-Interpolate-Named-1.00"

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
