# Maintainer:

pkgname=playwright
pkgver=1.19.1
pkgrel=1
pkgdesc="Node.js library to automate Chromium, Firefox and WebKit with a single API"
arch=('any')
url="https://playwright.dev"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tar.gz")
sha512sums=('8758822754b6780919ebb9590a63b1851893dce29ad49146b721cb699577d339ea22372c24bbb207f766a3bf15dda8e931dcfc8b0c486f6c63a5a4a1d46fbc50')
b2sums=('9f6db26dc81a553d49ed66aa76f9a683ba90d4265a2eeeb1b0d84001576a5ea1fedd2f5934d046852178faf590723338834004e22e1836ad8f79f5cbc3bbe546')

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
