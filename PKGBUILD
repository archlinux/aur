# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-file-find
pkgver=0.1
pkgrel=1
pkgdesc="File::Find for Perl 6"
arch=('any')
depends=('rakudo')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/tadzik/File-Find"
license=('MIT')
source=($pkgname-$pkgver::git+https://github.com/tadzik/File-Find)
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
