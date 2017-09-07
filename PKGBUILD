# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-oo-monitors
pkgver=1.1
pkgrel=1
pkgdesc="Objects with mutual exclusion and condition variables"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jnthn/oo-monitors"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jnthn/oo-monitors)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.markdown -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
