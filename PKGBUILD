# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname="playwright"
pkgver=1.41.2
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=("any")
url="https://playwright.dev"
license=("Apache-2.0")
depends=("nodejs")
makedepends=("npm")
provides=("playwright")
conflics=("python-playwright")
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=("99b29fb692f397137d8fb70f3db4e894fdb6b096bd5aada5c384aff4476c16392d9a6b76c44e99b41119b7df539a63b656bb258a42d1deea682efb3973c13225")

package(){
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
