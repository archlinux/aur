# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>

pkgname='perl-test-toolbox'
pkgver='0.4'
pkgrel='2'
pkgdesc="tools for testing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
checkdepends=()
url='https://metacpan.org/release/Test-Toolbox'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIKO/Test-Toolbox-$pkgver.tar.gz")
md5sums=('b8a83d332dcd0691b68ed9e0a0a53e7b')
sha512sums=('99d711a7cce4ac3a4fd37f4b7fc91cf75c5d4978ff83cd084599ed6c1818d22b30a3210a14b03da4646b53cc939b224937da3bea1c49bb13324c5583ee44bf81')
_distdir="Test-Toolbox-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."                  \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
