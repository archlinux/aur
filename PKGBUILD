# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.15.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('31068a8a2d6685fa19174f875c4e21e6cd82c1934999c012966234f7bca8b2867d168e515bd4642cde553026d2c3dc53ca8aa8eaf744e837f4385a6ea588c1a3')
b2sums=('443bb8b871799b0ed6b65a0b68feb800c758487851f44bff8b6fe28bbd0c45b8953229fbfc25928e174adebe4179bbc712e8183c93beabe89b9e4ac87979e5a0')

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
