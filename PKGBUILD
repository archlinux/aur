# Contributor: ordoban <dirk.langer@vvovgonik.de>
pkgname='perl-crypt-ecb'
pkgver='2.22'
pkgrel='1'
pkgdesc="Use block ciphers using ECB mode within perl scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepens=()
makedepends=()
url='https://metacpan.org/pod/Crypt::ECB'
source=("https://cpan.metacpan.org/authors/id/A/AP/APPEL/Crypt-ECB-$pkgver.tar.gz")
md5sums=('1930bfc9afefd65f50499e53781cb767')
sha512sums=('1d186001674ed4a0ee6933e441cd20e177e63a5809abcf865d48041712f31db312f0206883601369f031451ab702f6f9ef8be5c3f1cec6088ad200f541c04459')
_distdir="Crypt-ECB-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
