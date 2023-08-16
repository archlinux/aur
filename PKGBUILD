# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest
pkgver=1.0.1
_gitref=f71ccf9525d5be5b552d9ee7e76f9a19e51afc02  # untagged version 1.0.1
pkgrel=1
pkgdesc="Pure perl6 implementation of SHA-256 and RIPEMD-160 digests"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/grondilu/libdigest-perl6"
license=('Artistic2.0')
source=("$pkgname::git+$url.git#commit=${_gitref}")
b2sums=('SKIP')

check() {
  cd "$srcdir/$pkgname"

  echo 'Running tests...'
  PERL6LIB=lib prove -v -e "raku -I." t/
}

package() {
  cd "$srcdir/$pkgname"

  echo 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  echo 'Installing...'
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
