# See AUR interface to contact current maintainer.

_author=PJACKLAM
_perlmod=Math-BigInt
pkgname=perl-math-bigint
pkgver=1.999808
pkgrel=1
pkgdesc="Big integer calculations using the GNU Multiple Precision Arithmetic Library."
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.20.0')
provides=('perl-math-bigfloat' 'perl-math-bigint-calc' 'perl-math-bigint-calcemu')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/P/PJ/$_author/$_perlmod-$pkgver.tar.gz)
sha256sums=('279e7311f4ac0a00a61ffca2c3c508ba39a71b7510b4112af60979cf36d583c6')


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
