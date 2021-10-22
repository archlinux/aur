# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.16.0
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('1058e2c6af3fc13d52a3a4c7d725e82777f11499048669a2f016a7479c9f092706efac785831f4ce3f265640e5f68bdf3838f2f60e816bf6bfe6b5cefb4b33e9')
b2sums=('beeb0d42f172f1cf04b2f0c2ab54ddcf2e5515275dab10f194c9e3a73d3126ae136ed6ce254cc910f2503d26a29c6e688bf51ebcee9e0feb2c499f56bdc4ff5f')

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
