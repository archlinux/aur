# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-string-interpolate-named
pkgver=0.05
pkgrel=1
pkgdesc="Interpolated named arguments in string"
arch=('any')
license=('unknown')
options=('!emptydirs')
depends=()
url='https://metacpan.org/release/String-Interpolate-Named'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/String-Interpolate-Named-0.05.tar.gz')
sha512sums=('d3af17c265fb319d331ce768127681f2e027db00fc0cbf81bb32eeaae3f24cc8deb4598538c4b8a5b73a1a07f7964056e338fce3cebecf4a8cfc96533f0a28b6')
_distdir="String-Interpolate-Named-0.05"

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
