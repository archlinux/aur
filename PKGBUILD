# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=OCBNET
_perlmod=CSS-Sass
pkgname=perl-css-sass
pkgver=3.6.0
pkgrel=1
pkgdesc="Compile .scss files using libsass"
arch=('i686'
      'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0'
         'perl-linux-inotify2')
makedepends=('perl-extutils-cppguess')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/O/OC/OCBNET/${_perlmod}-${pkgver}.tar.gz)
md5sums=('379eecb0bcf3d370185f4c25a7d3cbe2')
sha512sums=('fe2b53f1636a104c7b618b5adff4a844430df9394cbd843a2196e65a2a440973a2cfeaf1ffc2c492e08a78f498e1f3d261e78c2517a499057dd2b7ea3a684caa')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
     PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
     PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
     PERL5LIB="." PERL_LOCAL_LIB_ROOT="" \
     MODULEBUILDRC=/dev/null
  perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete 
}

# vim:set ts=2 sw=2 et:
