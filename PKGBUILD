# Maintainer: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=playwright
pkgver=1.31.0
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('7059f589eddb758c3ff7f4f2dfce3609f3d2452cbe6563e3121af15a00be8cbfc2523ab944a54967051b5d5d54281414d55a3435eb6ca245e693d104662a951d')

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
