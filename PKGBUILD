# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=perl-mro-every
pkgver=1.0.1
pkgrel=1
pkgdesc="EVERY & EVERY::LAST pseudo-packages using mro."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='https://metacpan.org/dist/mro-EVERY'
_distdir="mro-EVERY"
source=("https://cpan.metacpan.org/authors/id/L/LE/LEMBARK//$_distdir-v$pkgver.tar.gz")
sha512sums=('1705f62a9798b9b258c117bcbf3e592cbfc8313dff1310858c86199154b7c55041d66f822d93fab06c46554961135ef89a0b1a3273456b9e8d421b6d26756adb')

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
