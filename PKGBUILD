# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-css-squish
pkgver=0.10
pkgrel=1
pkgdesc="Perl module to compact many CSS files into one big file"
arch=("any")
url="http://search.cpan.org/dist/CSS-Squish/"
license=("GPL" "PerlArtistic")
depends=("perl" "perl-uri")
checkdepends=("perl-test-longstring")
  # 'perl' provides 'perl-test-simple'
  # optionally 'perl-test-pod', 'perl-test-pod-coverage'

options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/T/TS/TSIBLEY/CSS-Squish-$pkgver.tar.gz)
md5sums=("59f8e2c26a2a89418d2274e8ca44ae97")

build() {
  cd "$srcdir/CSS-Squish-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/CSS-Squish-$pkgver"
  make test
}

package() {
  cd "$srcdir/CSS-Squish-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
