# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-pdf-grammar
pkgver=0.0.6
pkgrel=2
pkgdesc="Perl 6 grammars for parsing PDF Content Streams and File Structure"
arch=('any')
depends=('perl6' 'perl6-json-fast')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/p6-pdf/perl6-PDF-Grammar"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/p6-pdf/perl6-PDF-Grammar)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
