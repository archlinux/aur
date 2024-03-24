# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=commitlint-config-conventional
_pkgname=@commitlint/config-conventional
pkgver=19.1.0
pkgrel=1
pkgdesc="Commitlint config enforcing conventional commits"
arch=(any)
url="https://github.com/conventional-changelog/commitlint"
license=(MIT)
depends=(
  commitlint
  nodejs
)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/config-conventional-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7ade13700dd3f7af4bc0e1a15cf755874420e6662668c5ba8163896fce95a19b')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$_pkgname/license.md"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
