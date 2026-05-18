# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=xtool
pkgver=1.17.0
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
b2sums=('eb8908e177d5db6527e0535e05354d3b918b31f06b576206e71979ce30450ce64de0eaa6119e03bf88851f7b18e9f696654b6316485bab1790ab361cf13574cb')

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
