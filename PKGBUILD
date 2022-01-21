# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.18.0
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('18e5af71646d2fba3a4028fab6f642c6a1cac76b08857784984240a9074e660c734220a43ded619d31da6f5a7c4756c3bc72bbd377c34b6a086ecde672f83a83')
b2sums=('8c20aee1d823762a01b5797346ebb993003d53c5aab596d5e90be5a9de334dd8d5c2b3971a7e7026beabd45a8a8287fd74c12d1d245671c2b66ee4a78f9a95c2')

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
