# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-digest
pkgver=0.3.4
pkgrel=2
pkgdesc="Pure perl6 implementation of SHA-256 and RIPEMD-160 digests"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/grondilu/libdigest-perl6"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/grondilu/libdigest-perl6)
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
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;

  msg2 'Cleaning up precomp dir...'
  rm -rf "$pkgdir/usr/share/perl6/vendor/lib/.precomp"
}
