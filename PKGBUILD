# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xtool
pkgver=1.19.0
pkgrel=1
pkgdesc="Cross-platform Xcode replacement."
arch=('x86_64')
url="https://xtool.sh/"
license=('MIT')
depends=(
  'usbmuxd'
  'swift-bin'
  'zip'
  'xadi'
)
makedepends=(
  'git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/xtool-org/$pkgname/archive/refs/tags/$pkgver.tar.gz"
)
b2sums=('fb9487d136b0135cc72b8a403e994cb5c26c87cbd414d6137f8ec7f4c159382d6f7cad47fa1370af41dc3a744284c9e187464d37b4703f7bb4dfb41b46b59f44')

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
