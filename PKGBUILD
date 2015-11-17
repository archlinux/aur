# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-json-name
_p6name=JSON-Name
pkgver=0.0.1
pkgrel=1
pkgdesc="Provides a trait to store an alternative JSON Name"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/jonathanstowe/JSON-Name"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jonathanstowe/$_p6name/tar.gz/v$pkgver)
sha256sums=('eb4ed029d0765b3c73b675ebd5f70a0714c1da4fc3fd68f1f6d7b5c83cebba31')

check() {
  cd "$srcdir/$_p6name-$pkgver"

  msg2 'Running tests...'
  prove -r -e perl6
}

package() {
  cd "$srcdir/$_p6name-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
