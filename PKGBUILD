# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Paramjit Singh <contact at paramjit dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname="playwright"
pkgver=1.56.1
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
b2sums=('9d4cae0a4e20bf2e8a6ee0fde262494c85d047714ccc0e4de4d121be6d4037da1388f0f9e3bf9fdf13220742004266a593778a7de5e6cd58e3bc92d74ad769ca')

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
