# CPAN Name  : Path::Tiny
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>

pkgname=perl-path-tiny
pkgver=0.026
pkgrel=1
pkgdesc='A small and fast Perl package for working with file paths'
arch=('any')
url='http://search.cpan.org/dist/Path-Tiny'
license=('Apache')
depends=('perl>=5.10.1' 'perl-pathtools>=3.40' 'perl-autodie>=2.14')
checkdepends=('perl>=5.13.4' 'perl-devel-hide' 'perl-file-pushd' 'perl-test-deep'
	'perl-test-fatal' 'perl-test-failwarnings')
source=(http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Path-Tiny-0.026.tar.gz)
options=(!emptydirs)
md5sums=('3b52cfff6bb4edbdf5ca21789cd5bd2e')

build() {
  cd "$srcdir/Path-Tiny-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Path-Tiny-$pkgver"
  make test
}

package() {
  cd "$srcdir/Path-Tiny-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
