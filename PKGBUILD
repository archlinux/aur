# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=yarn
pkgver=0.16.0
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management.'
arch=(any)
url='http://yarnpkg.com'
license=('BSD')
depends=('nodejs')
source=("https://github.com/yarnpkg/yarn/releases/download/v$pkgver/yarn-v$pkgver.tar.gz")
sha256sums=('cd1d7eeb8eb2518441d99c914e5fd18b68e2759743d212dfd8f00574a1de6da8')

package() {
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R "$srcdir"/dist/* "$pkgdir"/usr/lib/node_modules/yarn

  # upstream packaging error for version 0.16.0
  rm "$pkgdir"/usr/lib/node_modules/yarn/ghr*

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn

  install -Dm644 "$srcdir"/dist/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
