# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.15.2
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('f99fbb7248a1cb147aacae6af03582e9e51b28045f5e9cb1a6335ca097e0c12afae2500ece387215088f0bf264748aa1b0b8198f1a567e5d52edf2dbfb03e480')
b2sums=('364d5c9dfc6acd496c37a7efa93a07f18da9db1a1477a4ebf581ba9b654a50671d9bbf839dbe8a638bf1ce73da94f6c507022b2473a981d46ae74764a6414439')

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
