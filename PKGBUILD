# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=clonepkg
pkgver=0.1.0
pkgrel=1
pkgdesc="Clones AUR packages with Git"
arch=('any')
depends=('git' 'perl6')
groups=('perl6')
url="https://github.com/atweiden/clonepkg"
license=('UNLICENSE')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('91eeffb5374465706bc940fa02e0580c64aa35f82cbf7f5930a5f5e37cd0882d')

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
