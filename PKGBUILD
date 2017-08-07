# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=perl6-html-myhtml
pkgver=0.3.0
pkgrel=2
pkgdesc="Wrapper for MyHTML, a fast HTML parsing C library"
arch=('any')
depends=('myhtml' 'perl6')
checkdepends=('perl')
makedepends=('git')
groups=('perl6')
url="https://github.com/MadcapJake/p6-MyHTML"
license=('PerlArtistic')
source=($pkgname-$pkgver::git+https://github.com/MadcapJake/p6-MyHTML)
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
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  perl6-install-dist \
    --to="$pkgdir/usr/share/perl6/vendor" \
    --for=vendor \
    --from=.
}
