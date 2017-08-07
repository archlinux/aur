# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-pretty
pkgver=0.1.0
pkgrel=2
pkgdesc="A minimal JSON (de)serializer that produces easily readable JSON"
arch=('any')
depends=('perl6' 'perl6-json-tiny')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/FROGGS/p6-JSON-Pretty"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/FROGGS/p6-JSON-Pretty)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
