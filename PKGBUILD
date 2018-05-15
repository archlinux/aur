# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-openapi-model
pkgver=1.0
pkgrel=1
pkgdesc="Work with OpenAPI documents in terms of a set of Perl 6 objects"
arch=('any')
depends=('perl6'
         'perl6-json-fast'
         'perl6-json-pointer'
         'perl6-yamlish')
checkdepends=('perl')
makedepends=('git')
groups=('croservices' 'perl6')
url="https://github.com/croservices/openapi-model"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/croservices/openapi-model)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6 t/
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
