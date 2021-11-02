# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.16.3
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('9df271fcea486fff0e7b12f7ad81b134debcee11b268cdd73697ee333a0f96b7a451122dcae8871ec3610bda100b1dc90e60a7e4edc4cb2c850a7ad98c7e8ca4')
b2sums=('9a9f758f7631b957a5dc5f1a1ac1ec0f06d2d33ff25b22a559e5d9ca58c78772b0058cfafa008f989aed5baf8d04cc3b98ffa90e54a02b4de49b98b70338979e')

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
