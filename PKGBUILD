# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.8.2
pkgrel=1
epoch=1
pkgdesc="Open-source AI agent that brings the power of Gemini directly into your terminal"
arch=(x86_64)
url="https://github.com/google-gemini/gemini-cli"
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  nodejs
)
makedepends=(npm)
source=("https://registry.npmjs.org/@google/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('73c1368d352ad4defe2b18c97dab6a577b4e6f188e2fa35a90ff1c43f3cc9faf9022a9a40e2e12d79771e5217979f2f16e6243fe5311dfa79cacd1cada96bdf7')

package() {
  npm install --global --omit=dev \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    $pkgname-$pkgver.tgz

  # Remove unnecessary files causing namcap warnings
  rm -r "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/marked/man"
  rm -r "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/@modelcontextprotocol/sdk/node_modules/ajv/scripts"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/shell-quote/print.py"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/open/xdg-open"
}
