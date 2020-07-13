# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Anonymous

pkgname=perl-html-selector-xpath
pkgver=0.25
pkgrel=1
pkgdesc="CSS Selector to XPath compiler"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
checkdepends=('perl-test-base>=0')
url="https://metacpan.org/release/HTML-Selector-XPath"
source=("http://search.cpan.org/CPAN/authors/id/C/CO/CORION/HTML-Selector-XPath-$pkgver.tar.gz")
sha512sums=('91430ae4898908c65ee2c527fd589fed16ac2699af028a51949c6fe2a7c84552dfdd370ad35a0fea4564914b1799b65efbf7025ace0fd9aa06e47081ce9b3bc8')
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
