# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname="playwright"
pkgver=1.48.2
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
b2sums=('f33e160d507d32c75d8d0b3cca01da1a27a3421f0916dea763c518df10e612278606262e840c7d51949a7a5b7a20fc9ce1739d8e472a25c455c33bc50354c086')

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
