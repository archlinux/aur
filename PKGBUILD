# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname="playwright"
pkgver=1.59.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=("any")
url="https://playwright.dev"
license=("Apache-2.0")
depends=("nodejs" "icu" "libwebp" "pcre" "libffi" "flite")
makedepends=("npm")
provides=("playwright")
conflics=("python-playwright")
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('62a222f609403fc6253633420d7fa8936430bdc19fd9e571423fc47d2ab6190bb1f1c0d46a933f25118fdc4b5d2edb99d935bb1c051e1e433e8a274f13e026f0')

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
