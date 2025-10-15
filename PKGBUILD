# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.9.0
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
sha512sums=('be82f33271ecd3ddd5bd980103c1d110de95899f2075138f9e63ee8f51054b18c665128ece589fcc24cdb2605dfdd4ab6f1232643dda3a94e469441b1b15fa8a')

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
