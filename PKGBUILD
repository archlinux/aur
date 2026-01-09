# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xtool
pkgver=1.16.1
pkgrel=1
pkgdesc="Cross-platform Xcode replacement."
arch=('x86_64')
url="https://xtool.sh/"
license=('MIT')
depends=(
  'usbmuxd'
  'swift-bin'
)
makedepends=(
  'git'
  'libplist'
  'xadi'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
b2sums=('9dde5f6d2ce39fed3566159258bd7a84c3eb0dfe6c2c941f2f758b4003ab944d950f7de8609d19a47ac2b0c637740fb7c137020264c286ba3afa5c5f8519a90b')

build() {
  cd "$pkgname-$pkgver"
  swift build -c release --product xtool
}

package() {
  cd "$pkgname-$pkgver"
  ls -lah

  # xtool.desktop
  install -Dm644 "Linux/xtool.desktop" "$pkgdir/usr/share/applications/xtool.desktop"
  # xtool.png
  install -Dm644 "Linux/xtool.png" "$pkgdir/usr/share/pixmaps/xtool.png"

  install -Dm755 ".build/release/xtool" "$pkgdir/usr/bin/xtool"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
