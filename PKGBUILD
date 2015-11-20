# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-marshal
_p6name=JSON-Marshal
pkgver=0.0.3
pkgrel=1
pkgdesc="Simple serialisation of objects to JSON"
arch=('any')
depends=('rakudo' 'perl6-json-name' 'perl6-json-tiny')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jonathanstowe/JSON-Marshal"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/jonathanstowe/JSON-Marshal)
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
