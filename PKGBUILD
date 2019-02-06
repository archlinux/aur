# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
_author=HAUKEX
_perlmod=Digest-SRI
pkgname=perl-digest-sri
pkgver=0.02
pkgrel=1
pkgdesc="Calculate and verify Subresource Integrity hashes (SRI)"
arch=('i686'
      'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
makedepends=('perl-extutils-cppguess' 'perl-test-simple')
options=(!emptydirs)
source=(https://cpan.metacpan.org/authors/id/H/HA/HAUKEX/${_perlmod}-${pkgver}.tar.gz)
md5sums=('0094a6ee422ed8ca8af7ef323c4b55bf')

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

