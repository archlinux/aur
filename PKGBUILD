# Contributor: ordoban <dirk.langer@vvovgonik.de>
pkgname='perl-crypt-ecb'
pkgver='2.21'
pkgrel='1'
pkgdesc="Use block ciphers using ECB mode within perl scripts"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
checkdepens=()
makedepends=()
url='https://metacpan.org/pod/Crypt::ECB'
source=('https://cpan.metacpan.org/authors/id/A/AP/APPEL/Crypt-ECB-2.21.tar.gz')
md5sums=('696e0658c344f5859f382dac7af92c3a')
sha512sums=('3d02e4f4937c925fe98aca702928ac3b9119ca133fec631c51f640585577ea0e50f3ee93d31f3915c5282cbe4ea1803e7f047b12dfbb0f32250a73719b41cbbf')
_distdir="Crypt-ECB-2.21"

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
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
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
