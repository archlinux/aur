# Maintainer: Dirk Langer <dirk.langer@vvovgonik.de>

pkgname='perl-string-util'
pkgver='1.26'
pkgrel='1'
pkgdesc="String processing utilities"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-number-misc')
makedepends=()
checkdepends=('perl-test-toolbox')
url='https://metacpan.org/release/String-Util'
source=("https://cpan.metacpan.org/authors/id/M/MI/MIKO/String-Util-$pkgver.tar.gz")
md5sums=('d0f13f8688bedef7174634bb57f7fbe4')
sha512sums=('27f4d9a36814695ca2123473f073577cc4ab31c0c1f9feccff8b9af0324c697df45efde981d638ed407521bb8348cf5512ebe1c9a5bfd5149df17b12014ed808')
_distdir="String-Util-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                   \
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
