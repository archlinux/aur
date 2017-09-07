# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-http-hpack
pkgver=0.9.1
pkgrel=1
pkgdesc="Implementation of RFC 7541 HPACK: Header Compression for HTTP/2"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/p6-http-hpack"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/p6-http-hpack)
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
