# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-net-zmq
pkgver=0.8
pkgrel=1
pkgdesc="ZeroMQ bindings for Perl6"
arch=('any')
depends=('perl6' 'zeromq')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/arnsholt/Net-ZMQ"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/arnsholt/Net-ZMQ)
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
