# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-io-socket-async-ssl
pkgver=0.3
pkgrel=1
pkgdesc="Provides an API like IO::Socket::Async, but with SSL support"
arch=('any')
depends=('perl6' 'perl6-openssl')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/p6-io-socket-async-ssl"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/p6-io-socket-async-ssl)
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
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
