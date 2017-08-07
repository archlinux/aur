# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-txn-remarshal
pkgver=0.0.1
pkgrel=2
pkgdesc="Double-entry accounting ledger file format converter"
arch=('any')
depends=('perl6' 'perl6-file-presence' 'perl6-txn-parser')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/atweiden/txn-remarshal"
license=('UNLICENSE')
source=($pkgname-$pkgver::git+https://github.com/atweiden/txn-remarshal
        git+https://github.com/atweiden/txn-examples)
sha256sums=('SKIP' 'SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  cp -dpr --no-preserve=ownership "$srcdir/txn-examples" t/data
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

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
