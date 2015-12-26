# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-terminal-ansicolor
pkgver=0.0.1
pkgrel=4
pkgdesc="Colorize terminal output"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/tadzik/Terminal-ANSIColor"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/Terminal-ANSIColor)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;

  msg2 'Cleaning up precomp dir...'
  rm -rf "$pkgdir/usr/share/perl6/vendor/lib/.precomp"
}
