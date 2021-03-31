# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=stylelint-scss
pkgver=3.19.0
pkgrel=1
pkgdesc='A collection of SCSS specific linting rules for stylelint'
arch=('any')
url='https://github.com/kristerkari/stylelint-scss'
license=('MIT')
depends=()
makedepends=('npm')
optdepends=('stylelint: peer dependency')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('c37883b9437303817ce9d2d154cf714747ef4c3fbda5adb501e9c3917b99028d')

package() {
  npm install -g --prefix="$pkgdir/usr" \
    --only=prod "$srcdir/$pkgname-$pkgver.tgz"

  # Remove stylelint
  rm -rf "$pkgdir"/usr/{lib/node_modules,bin}/stylelint

  # Fix directory permissions
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  install -Dm644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
