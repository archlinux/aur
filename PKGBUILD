# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=bailador
pkgver=0.0.1
pkgrel=2
pkgdesc="A bare-bones Dancer port for Perl6"
arch=('any')
depends=('perl6'
         'perl6-http-easy'
         'perl6-template-mojo'
         'perl6-template-mustache'
         'perl6-uri')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/tadzik/Bailador"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/Bailador)
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
