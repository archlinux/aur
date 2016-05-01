# See AUR interface to contact current maintainer.

_author=PJACKLAM
_perlmod=Math-BigInt
pkgname=perl-math-bigint
pkgver=1.999722
pkgrel=1
pkgdesc="Big integer calculations using the GNU Multiple Precision Arithmetic Library."
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.20.0')
provides=('perl-math-bigfloat' 'perl-math-bigint-calc' 'perl-math-bigint-calcemu')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/P/PJ/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('c76a2d5e6a996186a42a7e516b8d82217fb0cd18c7e1e55241322c4a859ccf40')


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
