# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=playwright
pkgver=1.16.2
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('96a9ddc32e6b0c8a77b4e2dec799672d2ae5b689aac60564464462e78eeb5e84e5daacbb3d8dabb476d4a2e425eca6365e855279278409856afdb2c9f9b6c936')
b2sums=('aeaf616e3a11791824d3757b87d7781074da2faefd9467d433e966a49a93241577e0707b502243f655eba9ae8cf78e1d29cbbe326291f2641de59b366e5eaaa8')

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
