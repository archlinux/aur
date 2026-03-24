# Maintainer: jxir <aur@jxir.de>

pkgname=katex
pkgver=0.16.42
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=('any')
url='https://katex.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('914f318b6bd9e48e0b6c3f301665310e6b48db4dfaeaaa8e64a14572ac0315b4')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
