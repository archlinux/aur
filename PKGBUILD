# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg
pkgver=0.1.0
pkgrel=1
pkgdesc="Download AUR packages with wget"
arch=('any')
depends=('perl6' 'wget')
groups=('perl6')
url="https://github.com/atweiden/wgetpkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('f06e74f171bed43317703a17e4595545550f9ed0500f3efc462fde5ba67fb96f')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

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
