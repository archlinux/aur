# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.17.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('0e2b02916f4c6e50c9352deb1bad69f0b88b036580ec863fe00e16ec35f80698567bf1ee5a32a6190a6dba4e0d54887952e4b05e95bf8da1f6f998231ecdc630')
b2sums=('bc4caac17f3fb38fcc97b31a320ccf17903f498d3233b75e4e2d6b0f10291f19e25cdd447a99674ea89dfd3749b2ad5bb346abf4dc625234ea09f62ca941eb20')

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
