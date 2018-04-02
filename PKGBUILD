# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-cro-websocket
pkgver=0.7.4
pkgrel=1
pkgdesc="Web socket support for the Cro library for building distributed systems in Perl 6"
arch=('any')
depends=('perl6'
         'perl6-base64'
         'perl6-cro-http'
         'perl6-crypt-random'
         'perl6-digest-sha1-native'
         'perl6-json-fast')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro-websocket"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/croservices/${pkgname##perl6-}/tar.gz/release-$pkgver)
sha256sums=('f8d5085e1151fc867fd6925f98c6e9705996e6e1b580bbf1006f7b4c229c73c6')

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
