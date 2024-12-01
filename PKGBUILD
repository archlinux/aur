# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=commitlint-config-conventional
_pkgname=@commitlint/config-conventional
pkgver=19.6.0
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
sha256sums=('74e7346c58a43ad3630029720e69219c7b039f9d0138b2b381514a3f7f2b35e1')

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
