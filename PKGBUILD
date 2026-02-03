# Maintainer: Grey-007 <https://github.com/Grey-007>

pkgname=nolio
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal calendar-based todo app built with Flutter"
arch=('x86_64')
url="https://github.com/Grey-007/nolio"
license=('MIT')

depends=(
  'gtk3'
  'libepoxy'
  'libxkbcommon'
  'libglvnd'
  'mesa'
)

makedepends=(
  'flutter'
)

provides=('nolio')
conflicts=('nolio-bin')

source=(
  "nolio-$pkgver.tar.gz::https://github.com/Grey-007/nolio/archive/refs/tags/v$pkgver.tar.gz"
  "nolio.desktop"
  "nolio.png"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "$srcdir/nolio-$pkgver"

  flutter pub get
  flutter build linux --release
}

package() {
  cd "$srcdir/nolio-$pkgver"

  install -d "$pkgdir/usr/lib/nolio"
  cp -r build/linux/x64/release/bundle/* "$pkgdir/usr/lib/nolio/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/nolio/nolio "$pkgdir/usr/bin/nolio"

  install -Dm644 \
    "$srcdir/nolio.desktop" \
    "$pkgdir/usr/share/applications/nolio.desktop"

  install -Dm644 \
    "$srcdir/nolio.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/nolio.png"
}
