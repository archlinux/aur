# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: yochananmarqos
# Contributor: Thiago Almeida <thiagoalmeidasa@gmail.com>

pkgname=nodejs-commitlint
_name=${pkgname#nodejs-}
pkgver=18.4.4
pkgrel=2
pkgdesc="Lint commit messages"
arch=(any)
url="https://github.com/conventional-changelog/commitlint"
license=(MIT)
depends=(nodejs)
makedepends=(npm)

source=(
  "https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz"
  "https://registry.npmjs.org/@commitlint/config-conventional/-/config-conventional-$pkgver.tgz"
)
noextract=(
  "$_name-$pkgver.tgz"
  "config-conventional-$pkgver.tgz"
)
sha256sums=(
  'eef2f1bb00bb8e342c2bb37fb09e2d7251bd3a01e9e9d7cb33ad4d2e90f5d7ae'
  '7067d84963461d3c642120653e7edafd1f7c3071898b2b295d82a61a237a450f'
)

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$_name-$pkgver.tgz"
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/config-conventional-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$_name/license.md"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
