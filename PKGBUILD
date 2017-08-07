# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-scgi
pkgver=0.0.1
pkgrel=2
pkgdesc="A SCGI library for Perl 6"
arch=('any')
depends=('perl6' 'perl6-http-status' 'perl6-netstring' 'perl6-psgi')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/supernovus/SCGI"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/supernovus/SCGI)
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
