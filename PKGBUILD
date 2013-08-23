# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-scalar-defer
pkgver=0.23
pkgrel=1
pkgdesc="Perl module that provides lazy evaluation of scalars"
arch=("any")
url="http://search.cpan.org/dist/Scalar-Defer/"
license=("MIT")
depends=("perl" "perl-class-insideout" "perl-exporter-lite")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/Scalar-Defer-$pkgver.tar.gz)
md5sums=("df4e9d0b8ca20274376a032d40703c57")

build() {
  cd "$srcdir/Scalar-Defer-$pkgver"
  PERL_AUTOINSTALL="--skipdeps" PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Scalar-Defer-$pkgver"
  make test
}

package() {
  cd "$srcdir/Scalar-Defer-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
