# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.18.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('f04697f44b5bb40a0cab9b67cc8b280376ff57ce95ffa32adac92e394e2a130fb9395c6cd65c1eb03c268f2fd1554d507f1e54bb0490ce1a78e70c87db6a1af8')
b2sums=('88e7aea9cc05fa6387bb1c95bc5b20f1197c5d237ac1e714bc544fbe8e7dc21dbbe99cafad2cb3bacecdf283bda9e9ec31ce6ae60514572b8e8af36689ff7058')

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
