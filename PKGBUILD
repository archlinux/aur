# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-shell-command
pkgver=0.0.1
pkgrel=5
pkgdesc="Common shell command replacements"
arch=('any')
depends=('perl6' 'perl6-file-find' 'perl6-file-which')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/tadzik/Shell-Command"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/Shell-Command)
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
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
