# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-data-dump
pkgver=0.0.1
pkgrel=2
pkgdesc="a colorful? data dumper for perl6"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
optdepends=('perl6-terminal-ansicolor: colorful output')
groups=('perl6')
url="https://github.com/tony-o/perl6-data-dump"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/tony-o/perl6-data-dump)
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
