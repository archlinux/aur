# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.16.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('0fba3b8adab1b09e2fc783a570fbfd6eb39eef83362788030edf6a548f69b60b47b710a2e3c23cb525c4fedad7d4fa0716e25e795968fad1af86d8acbcf1aed4')
b2sums=('862721e4cca1a4841b60e167f10feb93f63007c4c969edd65acbdf25431c8a485fea10d2877c89c0e3d7ed8a53caaf58e426dc6758bf5db8d3b4c7d3aa36fa00')

package() {
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
     --prefix "$pkgdir/usr" \
     "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tar.gz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
}
