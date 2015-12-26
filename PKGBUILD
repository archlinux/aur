# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-fast
pkgver=0.3
pkgrel=1
pkgdesc="A naive, fast json parser and serializer"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/timo/json_fast"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/timo/json_fast)
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
}
