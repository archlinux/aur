# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Anonymous

pkgname=perl-html-selector-xpath
pkgver=0.26
pkgrel=1
pkgdesc="CSS Selector to XPath compiler"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
checkdepends=('perl-test-base')
url="https://metacpan.org/release/HTML-Selector-XPath"
source=("http://search.cpan.org/CPAN/authors/id/C/CO/CORION/HTML-Selector-XPath-$pkgver.tar.gz")
sha512sums=('d0f706b61e6676e9e32f8aa81ba126c46df3a5163f40de977058efd220bfeb374fbbfb56df589454543383b5d6be6f851faa968d38512cfa7ea76050411baab9')
_distdir="HTML-Selector-XPath-$pkgver"

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
