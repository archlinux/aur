# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-base64
pkgver=0.1.0
pkgrel=1
pkgdesc="Lazy base64 encoding and decoding routines"
arch=('any')
depends=('perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/ugexe/Perl6-Base64"
license=('PerlArtistic')
options=('!purge')
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('SKIP')

check() {
  cd "$srcdir/$pkgname"

  echo 'Running tests...'
  PERL6LIB=lib prove --ext .rakutest -v -e "raku -I." t/
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
