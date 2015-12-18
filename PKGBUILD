# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-gumbo
pkgver=0.0.1
pkgrel=1
pkgdesc="Binding of the gumbo C library, a html parser lib"
arch=('any')
depends=('gumbo' 'rakudo' 'perl6-html-parser' 'perl6-xml')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/Skarsnik/perl6-gumbo"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/Skarsnik/perl6-gumbo)
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Running tests...'
  PERL6LIB=lib prove -r -e perl6
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/share/perl6/vendor/lib"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/share/perl6/vendor/lib" \;
}
