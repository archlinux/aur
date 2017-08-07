# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-readline
pkgver=0.0.2
pkgrel=2
pkgdesc="Perl 6 interface to GNU Readline"
arch=('any')
depends=('perl6' 'readline')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/drforr/perl6-readline"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/drforr/perl6-readline)
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
