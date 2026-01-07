# Maintainer: KometTeam
pkgname=komet
pkgver=0.4.1
pkgrel=1
pkgdesc="Komet — Multifunctional MAX client (Flutter desktop)"
arch=('x86_64')
url="https://github.com/KometTeam/Komet"
license=('GPL3')
depends=(
  'gtk3'
  'glib2'
  'libsecret'
  'libepoxy'
  'at-spi2-core'
)
makedepends=(
  'flutter'
  'git'
)
source=("git+https://github.com/KometTeam/Komet.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Komet"
  flutter build linux --release
}

package() {
  cd "$srcdir/Komet"

  # Основной бинарник
  install -Dm755 build/linux/x64/release/bundle/Komet \
    "$pkgdir/usr/bin/komet"

  # Все сопутствующие библиотеки
  install -d "$pkgdir/usr/lib/komet"
  cp -r build/linux/x64/release/bundle/lib \
        "$pkgdir/usr/lib/komet/"
  cp -r build/linux/x64/release/bundle/data \
        "$pkgdir/usr/lib/komet/"

  # Desktop launcher
  install -Dm644 komet.desktop \
    "$pkgdir/usr/share/applications/komet.desktop"

  # Иконки
  install -Dm644 assets/icon/komet_512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/komet.png"
}
