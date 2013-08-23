# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-games-poker-handevaluator
pkgver=1.1
pkgrel=1
pkgdesc="Perl module for evaluating of poker hands"
arch=("i686" "x86_64")
url="http://search.cpan.org/dist/Games-Poker-HandEvaluator/"
license=("GPL" "PerlArtistic")
source=(http://search.cpan.org/CPAN/authors/id/S/SI/SIMON/Games-Poker-HandEvaluator-$pkgver.tar.gz
        makefile.patch)
depends=("perl" "poker-eval")

options=(!emptydirs)
md5sums=('cbc1be13691044d323e75747a5bdb4b6'
         '8c79763e912a894a9bc5ddbd6932e4ba')

build() {
  cd "$srcdir/Games-Poker-HandEvaluator-$pkgver"
  patch -i $srcdir/makefile.patch
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Games-Poker-HandEvaluator-$pkgver"
  make test
}

package() {
  cd "$srcdir/Games-Poker-HandEvaluator-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
