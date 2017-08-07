# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-test-notice
pkgver=1.001001
pkgrel=2
pkgdesc="Display noticable messages to users during tests"
arch=('any')
depends=('perl6')
checkdepends=('perl' 'perl6-test-meta')
makedepends=('git')
groups=('perl6')
url="https://github.com/zoffixznet/perl6-Test-Notice"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/zoffixznet/perl6-Test-Notice)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 *.md *.png -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
