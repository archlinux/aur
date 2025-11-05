# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: huyz

pkgname=gemini-cli
pkgver=0.12.0
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
sha512sums=('35f676000d5ac37a6a571261aa101565ec2e5447eed4079287423e24ab4a74fb6e582c9c3f81b2fc6e0885d29a2eecf2420dd4508c260a8f352b532c72d00475')

package() {
  npm install --global --omit=dev \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    $pkgname-$pkgver.tgz

  # Remove unnecessary files causing namcap warnings
  rm -r "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/marked/man"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/shell-quote/print.py"
  rm "$pkgdir/usr/lib/node_modules/@google/gemini-cli/node_modules/open/xdg-open"
}
