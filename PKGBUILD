# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-http-tinyish
pkgver=0.0.1
pkgrel=3
pkgdesc="perl6 port of HTTP::Tinyish"
arch=('any')
depends=('curl' 'perl6' 'perl6-file-temp')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/skaji/perl6-HTTP-Tinyish"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/skaji/perl6-HTTP-Tinyish)
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
