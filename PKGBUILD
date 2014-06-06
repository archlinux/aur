# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-extutils-cchecker
_realname=ExtUtils-CChecker
pkgver=0.09
pkgrel=1
pkgdesc="CPAN/ExtUtils::CChecker - configure-time utilities for using C headers,
libraries, or OS features"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-cbuilder')
makedepends=('perl-test-exception' 'perl-test-fatal')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_realname}-${pkgver}.tar.gz")
md5sums=('2c7b30a367fc67851be44f9b4c98b652')

build() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
