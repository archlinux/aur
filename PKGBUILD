# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-rpc
pkgver=0.17.1
pkgrel=2
pkgdesc="JSON-RPC 2.0 client and server for Perl 6"
arch=('any')
depends=('perl6'
         'perl6-http-easy'
         'perl6-json-tiny'
         'perl6-lwp-simple'
         'perl6-uri')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/bbkr/jsonrpc"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/bbkr/jsonrpc)
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
