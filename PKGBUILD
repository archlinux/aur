# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-cro-http
pkgver=0.7.3
pkgrel=1
pkgdesc="HTTP (including HTTPS and HTTP/2) support for the Cro library for building distributed systems in Perl 6"
arch=('any')
depends=('perl6'
         'perl6-base64'
         'perl6-cro-core'
         'perl6-cro-tls'
         'perl6-crypt-random'
         'perl6-datetime-parse'
         'perl6-http-hpack'
         'perl6-io-path-childsecure'
         'perl6-io-socket-async-ssl'
         'perl6-json-fast'
         'perl6-json-jwt'
         'perl6-oo-monitors')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro-http"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/croservices/${pkgname##perl6-}/tar.gz/release-$pkgver)
sha256sums=('71f3be79bd47023a535582010f322e20af791e82595fec76f63b72bd629274e2')

check() {
  cd "$srcdir/${pkgname##perl6-}-release-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/${pkgname##perl6-}-release-$pkgver"

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
