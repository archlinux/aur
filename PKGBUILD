# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=panda
pkgver=2016.02
pkgrel=1
pkgdesc="Perl6 module installer"
arch=('any')
depends=('curl'
         'perl6'
         'perl6-file-find'
         'perl6-json-fast'
         'perl6-shell-command')
checkdepends=('perl')
makedepends=('git')
optdepends=('wget: download metadata files with wget')
groups=('perl6')
url="https://github.com/tadzik/panda"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/panda)
sha256sums=('SKIP')
conflicts=('perl6-panda')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 {CONTRIBUTING,README}.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
