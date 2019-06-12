# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>

pkgname='perl-number-misc'
pkgver='1.2'
pkgrel='2'
pkgdesc="handy utilities for numbers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=()
makedepends=()
checkdepends=()
url='https://metacpan.org/release/Number-Misc'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIKO/Number-Misc-$pkgver.tar.gz")
md5sums=('7a0009b5be60378f204ed1fc9b2d5a19')
sha512sums=('f160de841bc895481f6d9422ed639391fd9e9b65239e3c0adf25b63e88902e7608049496ecec864cae39a046e5f1903f3e3ede1cb71018203f62da2ded67b8eb')
_distdir="Number-Misc-$pkgver"

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
