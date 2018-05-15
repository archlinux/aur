# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-cro-tls
pkgver=0.7.5
pkgrel=1
pkgdesc="TLS support for the Cro library for building distributed systems in Perl 6"
arch=('any')
depends=('perl6'
         'perl6-cro-core'
         'perl6-io-socket-async-ssl')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro-tls"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/croservices/${pkgname##perl6-}/tar.gz/release-$pkgver)
sha256sums=('adcf5f9fa7dbf6da187a05e664384c783ed9b277bd5326ee2f60e777eda261d3')

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
