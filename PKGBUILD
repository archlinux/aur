# Maintainer: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>

_author=L/LB/LBROCARD
_perlmod=Test-Expect
pkgname=perl-test-expect
pkgver=0.31
pkgrel=3
pkgdesc='Test::Expect - Automated driving and testing of terminal-based programs'
arch=('any')
url='http://search.cpan.org/~lbrocard/Test-Expect/'
license=('GPL' 'PerlArtistic')
depends=(
perl
perl-expect-simple
perl-class-accessor-chained
)
makedepends=(perl-expect)
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
sha256sums=('48a0b892d4e63ec5328b85ef7e1804304b4ca63c345c84a233734b3aa312f3cd')
build(){
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
