# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.11.3
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
sha512sums=('86c444333fc09359547aa629904b7b464f0eef7b7dfa0fc8ec670adb3bd4315393c7a980475da8b278c16602cee48f3d91a67e97a41dddd68f7ac975a82f845a')

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
