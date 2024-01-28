# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Achilleas Pipinellis <axilleas at archlinux dot gr>

pkgname=markdownlint-cli
pkgver=0.39.0
pkgrel=1
pkgdesc="MarkdownLint Command Line Interface"
arch=(any)
url="https://github.com/igorshubovych/markdownlint-cli"
license=(MIT)
depends=(nodejs)
makedepends=(
  npm
  jq
)

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('3ac4533a0f5ea881fb0580818c0decb0b5c15627fa99aa005617866f6599e511')

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
