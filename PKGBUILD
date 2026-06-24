# Maintainer: Algorant <Algorantic@proton.me>

pkgname=brainfile
pkgver=0.17.2
pkgrel=1
pkgdesc="Terminal task coordination protocol manager"
arch=('any')
url="https://github.com/brainfile/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(
  "https://registry.npmjs.org/@brainfile/cli/-/cli-$pkgver.tgz"
  "LICENSE"
)
sha256sums=(
  'a18448062a9393f8fa3179bb5205efa62db9089f372dc693ba3e26ffdde27484'
  '4c664526268b1e3267e9bc2d4e048fc64c9da12a46d50fd7f3a54b7398690d8e'
)

package() {
  npm install -g \
    --prefix "$pkgdir/usr" \
    --cache "$srcdir/npm-cache" \
    --omit=dev \
    "$srcdir/cli-$pkgver.tgz"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/usr/lib/node_modules/@brainfile/cli/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  ln -s "/usr/lib/node_modules/@brainfile/cli/CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  find "$pkgdir/usr" -type f -exec chmod 644 {} +
  chmod 755 "$pkgdir/usr/lib/node_modules/@brainfile/cli/dist/cli.js"
}
