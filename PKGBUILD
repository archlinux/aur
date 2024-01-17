# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=aicommits
pkgver=1.11.0
pkgrel=2
pkgdesc="A CLI that writes your git commit messages for you with AI"
arch=(any)
url="https://github.com/Nutlope/aicommits"
license=(MIT)
depends=(nodejs)
makedepends=(
  jq
  npm
)

source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('b74cf25eb31eb7098d01f482cd64a87e2f59d7efa11f5273fbb353f35e850c5d')

package() {
  npm install --global \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/package/LICENSE"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
