# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-http-useragent
pkgver=1.1.11
pkgrel=2
pkgdesc="Web user agent class for Perl 6"
arch=('any')
depends=('perl6'
         'perl6-datetime-parse'
         'perl6-encode'
         'perl6-file-temp'
         'perl6-http-status'
         'perl6-mime-base64'
         'perl6-uri')
checkdepends=('perl' 'perl6-io-capture-simple')
makedepends=('git')
optdepends=('perl6-io-socket-ssl: fetch https sites')
groups=('perl6')
url="https://github.com/sergot/http-useragent"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/sergot/http-useragent)
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
