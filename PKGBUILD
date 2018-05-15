# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-pointer
pkgver=1.0
pkgrel=1
pkgdesc="JSON Pointer implementation in Perl 6"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/json-pointer"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/croservices/json-pointer)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6 t/
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

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
