# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yochananmarqos
# Contributor: Thiago Almeida <thiagoalmeidasa@gmail.com>

pkgname=commitlint
pkgver=18.5.0
pkgrel=1
pkgdesc="Lint commit messages"
arch=(any)
url="https://github.com/conventional-changelog/commitlint"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-commitlint)
replaces=(nodejs-commitlint)

source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  "https://registry.npmjs.org/@commitlint/config-conventional/-/config-conventional-$pkgver.tgz"
)
noextract=(
  "$pkgname-$pkgver.tgz"
  "config-conventional-$pkgver.tgz"
)
sha256sums=(
  '317e6840583b931ff4452c104a93349d48d8039b30c4d9008e860be2c75d7534'
  'e62678090d6a375c905a1f355c13a67b15bc4b96a44ccb26e160f0799cf727fc'
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
