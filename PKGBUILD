# maintainer: web.de jan.stuehler
_author="Johan Vromans"
pkgname=perl-text-layout
pkgver=0.018.3
pkgrel=1
pkgdesc="Pango style markup formatting"
arch=('any')
license=('Artistic2.0')
options=('!emptydirs')
depends=()
url='https://metacpan.org/pod/Text::Layout'
source=('https://cpan.metacpan.org/authors/id/J/JV/JV/Text-Layout-0.018.3.tar.gz')
sha512sums=('1ce5f1cb40e96d85f7d44cb752a6cded1004ce40aedce2374ee34c8da5e704aa7d19fb08bfaecf5aa93221a251394da7a397ae5534e84ba7d99717fdc7ba2450')
_distdir="Text-Layout-0.018.3"

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
