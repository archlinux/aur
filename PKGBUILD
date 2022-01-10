# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.17.2
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('bb51d9995a1e2c22e9b4d729b8eca9e4a7c1cec76c2f113d09178af368bfa7c8f98bb10faad6377d7efb48c1ea0c678eeed2c14989366ba7850d59507d248036')
b2sums=('747b641ad66a4511ae343e39dc13e0d575c6b9654035ff0b0cb5f53297563394d26bdc34acc97cbb8aa54f57c048d75fd6deb7b098dc3a82ec3f7662e61ac0b4')

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
