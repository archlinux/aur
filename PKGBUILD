# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=commitlint-config-conventional
_pkgname=@commitlint/config-conventional
pkgver=20.2.0
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
sha256sums=('fee72b08742ae14c7238f3a25a78a6c29b53be2d52e4684b043a0a10f4e96653')

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
