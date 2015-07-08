# See AUR interface to contact current maintainer.

_author=PJACKLAM
_perlmod=Math-BigInt-GMP
pkgname=perl-math-bigint-gmp
pkgver=1.38
pkgrel=1
pkgdesc="Big integer calculations using the GNU Multiple Precision Arithmetic Library."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.20.0' 'gmp')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/P/PJ/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('1ad0cac911a08f150c5e5a8286aec20de21c863bd27b8f002456cff11e086f15')


build() {
  cd "$srcdir/$_perlmod-$pkgver"
  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et ft=sh:
