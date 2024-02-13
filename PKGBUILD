# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yochananmarqos
# Contributor: Thiago Almeida <thiagoalmeidasa@gmail.com>

pkgname=commitlint
pkgver=18.6.1
pkgrel=1
pkgdesc="Lint commit messages"
arch=(any)
url="https://github.com/conventional-changelog/commitlint"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  "https://registry.npmjs.org/@commitlint/config-conventional/-/config-conventional-$pkgver.tgz"
)
noextract=(
  "$pkgname-$pkgver.tgz"
  "config-conventional-$pkgver.tgz"
)
sha256sums=(
  '2bd7739a64cfbd671c4c014d44ed479f3fea5124fc4d1629e083a1ddabf0aef4'
  '3dcd0362001b912c8979c05e5495577419e93337d4a80aaa79d373dcc69fe20c'
)

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/config-conventional-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/license.md"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
