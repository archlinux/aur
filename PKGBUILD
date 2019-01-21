# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=OCBNET
_perlmod=CSS-Sass
pkgname=perl-css-sass
pkgver=3.4.10
pkgrel=1
pkgdesc="Compile .scss files using libsass"
arch=('i686'
      'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.i10.0'
         'perl-linux-inotify2')
makedepends=('perl-extutils-cppguess')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/C/CH/CHAMAS/${_perlmod}-${pkgver}.tar.gz)
md5sums=('d407da50fba8d5c583fc4ae418f52523')
sha512sums=('742c4d6d0d0dc5ace30313146f57772f3ff0ef0c83d1eab8e54969d12f84bf9392f8875a6985f4b959f20a550db0d517fe30234a5c686b0d7716c8a7d97b5979')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
     PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
     PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
     PERL5LIB="" PERL_LOCAL_LIB_ROOT="" \
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
