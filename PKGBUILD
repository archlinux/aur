# Maintainer: jxir <aur@jxir.de>

pkgname=katex
pkgver=0.16.0
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=('any')
url='https://katex.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('6bd379d7d9a7ddadc58551f16d4c6dd34e125d06bf64c610ab0f3380763e26b2')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
