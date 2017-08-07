# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-slang-tuxic
pkgver=0.0.1
pkgrel=2
pkgdesc="Allows you to put whitespace between the name of a subroutine and the opening parenthesis"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/FROGGS/p6-Slang-Tuxic"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/FROGGS/p6-Slang-Tuxic)
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
