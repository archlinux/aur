# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-config-simple
pkgver=0.0.1
pkgrel=2
pkgdesc="A simple module for your configuration file needs"
arch=('any')
depends=('perl6' 'perl6-config-ini' 'perl6-data-dump' 'perl6-json-pretty')
checkdepends=('perl' 'perl6-test-meta')
makedepends=('git')
groups=('perl6')
url="https://github.com/Skarsnik/perl6-config-simple"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/Skarsnik/perl6-config-simple)
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
