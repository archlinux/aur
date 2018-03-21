# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-jwt
pkgver=1.0
pkgrel=1
pkgdesc="JWT signing and verifying using OpenSSL"
arch=('any')
depends=('perl6'
         'perl6-digest-hmac'
         'perl6-json-fast'
         'perl6-mime-base64'
         'perl6-openssl')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/retupmoca/p6-JSON-JWT"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/retupmoca/p6-JSON-JWT)
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
