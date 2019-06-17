# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-app-packager
pkgver=1.430
pkgrel=1
pkgdesc="Abstraction for Packagers"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url='https://metacpan.org/release/App-Packager'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/App-Packager-1.430.tar.gz')
sha512sums=('3e4d8ac03614f6fa77a881f62d5ebad03b999ac2fb8f8441b1417f45a4a6e2c33d79d106f0d2017c9819a5136d9bf4e062e59780d700ad2d80717bc3a5e25d39')
_distdir="App-Packager-1.430"

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
