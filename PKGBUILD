# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: yochananmarqos
# Contributor: Thiago Almeida <thiagoalmeidasa@gmail.com>

pkgname=commitlint
pkgver=20.3.1
pkgrel=1
pkgdesc="Lint commit messages"
arch=(any)
url="https://github.com/conventional-changelog/commitlint"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
optdepends=('commitlint-config-conventional: config enforcing conventional commits')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('6b0ed5c56ac8b0e7a4d46d36ed5768a6d893816ee45bb381ae6335ba1645af27306cebd5151ad1e017a65d226f4c39d4129ca0429754fa4243b5cb6f87319d51')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/license.md"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
