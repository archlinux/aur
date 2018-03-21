# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-cro-core
pkgver=0.7.3
pkgrel=1
pkgdesc="The heart of the Cro library for building distributed systems in Perl 6, including pipeline composition and TCP support"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/cro-core"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/croservices/${pkgname##perl6-}/tar.gz/release-$pkgver)
sha256sums=('7ea9a03a0638a142afa5251fb5529b4308bcda0c8184f1943f897317df5b56a7')

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
