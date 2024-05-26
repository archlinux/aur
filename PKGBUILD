# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=markdown-link-check
pkgver=3.12.2
pkgrel=1
pkgdesc="Checks aliveness of hyperlinks in markdown documents"
arch=(any)
url="https://github.com/tcort/markdown-link-check"
license=(ISC)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8cb9c0a70f368f976f2b6ea8b641c209124d18c1311244b45b13202188800cbf')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE.md"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  # Remove man pages to silence namcap warnings
  rm -r "$pkgdir/usr/lib/node_modules/markdown-link-check/node_modules/marked/man"
}
