# Contributor: ordoban <dirk.langer@vvovgonik.de>
pkgname='perl-crypt-ecb'
pkgver='2.23'
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
md5sums=('0bc63fea36ce864469ee8bf6c410ade4')
sha512sums=('a48277362dd30586ac4b5ba91f1e4e02990b51b49bc073bd06110baa9bd6a3aec1faac508120642f43762ee8f92aa16b46292f4e2c81704c31778dcc72edf1d8')
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
