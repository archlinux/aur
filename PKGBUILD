# See AUR interface to contact current maintainer.

_author=PJACKLAM
_perlmod=Math-BigInt-GMP
pkgname=perl-math-bigint-gmp
pkgver=1.49
pkgrel=1
pkgdesc="Big integer calculations using the GNU Multiple Precision Arithmetic Library."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.22.1' 'gmp' 'perl-math-bigint')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/P/PJ/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('757b5f7859f1e82ef96ef560bac22fe37c1d7d6759f479a312676ad65181362f')


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
