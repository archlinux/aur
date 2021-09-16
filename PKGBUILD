# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=stylelint-scss
pkgver=3.21.0
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
sha256sums=('956175a96a26747114aa5e0e5f2d8327d2a9e6e18823d8042bf793b7d94a61e8')

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
