# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=markdown-link-check
pkgver=3.11.1
pkgrel=1
pkgdesc="Checks aliveness of hyperlinks in markdown documents"
arch=(any)
url="https://github.com/tcort/markdown-link-check"
license=(custom:ICS)
depends=(nodejs)
makedepends=(npm)

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('91c1b356a6a6040e10b0551e02f569e853ec71e9ad96fabf98b52f4ddf348e5d')

package() {
    npm install -g \
      --cache "$srcdir/npm-cache" \
      --prefix "$pkgdir/usr" \
      "$srcdir/$pkgname-$pkgver.tgz"
    install -Dm644 \
      "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE.md" \
      "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
