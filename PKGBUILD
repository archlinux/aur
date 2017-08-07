# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-system-passwd
pkgver=0.04
pkgrel=3
pkgdesc="Easily search for system users"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/dnmfarrell/System-Passwd"
license=('BSD')
options=('!purge')
source=($pkgname-$pkgver::git+https://github.com/dnmfarrell/System-Passwd)
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
  install -Dm 644 README.pod -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
