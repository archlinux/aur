# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=perl-extutils-cchecker
_realname=ExtUtils-CChecker
pkgver=0.11
pkgrel=1
pkgdesc="CPAN/ExtUtils::CChecker - configure-time utilities for using C headers,
libraries, or OS features"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-extutils-cbuilder')
makedepends=('perl-test-exception' 'perl-test-fatal' 'perl-module-build')
url="https://metacpan.org/release/${_realname}"
source=("http://cpan.metacpan.org/authors/id/P/PE/PEVANS/${_realname}-${pkgver}.tar.gz")
md5sums=('6c40b0aa26907aed861288808dee755c')

build() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build.PL --installdirs vendor --destdir "$pkgdir"
  PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build
}

check() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build test
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null perl Build install
  find "$pkgdir" \( -name '.packlist' -o -name '*.pod' \) -delete
}

# vim:set ts=2 sw=2 et:
