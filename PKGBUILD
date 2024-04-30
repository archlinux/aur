# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=markdownlint-cli
pkgver=0.40.0
pkgrel=1
pkgdesc="MarkdownLint Command Line Interface"
arch=(any)
url="https://github.com/igorshubovych/markdownlint-cli"
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('2919296cbdbce0de23dea9177d7da930db3b818026dbaa9f3f0d263c6675930a')

package() {
  npm install -g \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
