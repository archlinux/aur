# Maintainer: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=playwright
pkgver=1.32.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('1a7122cf2b1632fa2a1c2dc8f65f3ee3f67178bc0b35d2491bbeb174a1b1cce708643730e514a4fc52ab15be42b80fb370ba6320cda9f5e47d6780ae5039165e')

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
