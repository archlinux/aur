# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-dbiish
pkgver=0.0.1
pkgrel=3
pkgdesc="Database connectivity for Perl 6"
arch=('any')
depends=('perl6')
checkdepends=('perl' 'perl6-nativecall-typediag')
makedepends=('git')
groups=('perl6')
url="https://github.com/perl6/DBIish"
license=('BSD')
options=('!purge')
source=($pkgname-$pkgver::git+https://github.com/perl6/DBIish)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

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
