# Maintainer: jxir <aur@jxir.de>

pkgname=katex
pkgver=0.16.14
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=('any')
url='https://katex.org'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('a37dd0a91ae6af9a60ddfae2ca135763d77a22d89df94eba5e6d3b449866c4fd')

package() {
  npm install -g --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

  # npm installs package.json owned by build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
