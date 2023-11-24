# Maintainer: Lari Tikkanen <lartza@outlook.com>
# Contributor: Anonymous

pkgname=perl-html-selector-xpath
pkgver=0.28
pkgrel=1
pkgdesc="CSS Selector to XPath compiler"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.8.1')
checkdepends=('perl-test-base')
url="https://metacpan.org/release/HTML-Selector-XPath"
source=("http://search.cpan.org/CPAN/authors/id/C/CO/CORION/HTML-Selector-XPath-$pkgver.tar.gz")
sha512sums=('325c7aba8ddbf7c02be3ff6fd242ff6b936e79ca52c62c58e05b74c8a3f6e2c89e298d8b8b30751b15b4d5d2bd9dfa5e6dddf774928652641d2a54e59a2b5ac5')
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
