# Maintainer: Mark CDA <aclo.create@gmail.com>

pkgname=jeff

_tag=21360032435f1649d7ca375a4339482f69d5a817
source=(git+https://github.com/markcda/jeff.git#tag=$_tag)

pkgver=2.4.1.r3.gb1b0621
pkgrel=2
pkgdesc="Extensible chatbot and automation tool"
arch=("x86_64")
url="https://github.com/markcda/jeff"
license=('MIT')
depends=('python' 'qt5-base')
makedepends=('git' 'make' 'cmake' 'qt5-tools')
options=('strip')
sha256sums=('SKIP')

build() {
  cd jeff
  git submodule init
  git submodule update
  cd jeff-desktop
  mkdir target
  cmake -S . -B ./target
  lrelease l10n/jeff_ru.ts -qm l10n/jeff_ru.qm
  lrelease l10n/jeff_ua.ts -qm l10n/jeff_ua.qm
  cd target
  make jeff-qt
}

package() {
  cd jeff
  install -Dm644 packaging/icons/hicolor/24x24/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/24x24/jeff.png"
  install -Dm644 packaging/icons/hicolor/32x32/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/32x32/jeff.png"
  install -Dm644 packaging/icons/hicolor/48x48/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/48x48/jeff.png"
  install -Dm644 packaging/icons/hicolor/64x64/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/64x64/jeff.png"
  install -Dm644 packaging/icons/hicolor/72x72/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/72x72/jeff.png"
  install -Dm644 packaging/icons/hicolor/96x96/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/96x96/jeff.png"
  install -Dm644 packaging/icons/hicolor/128x128/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/128x128/jeff.png"
  install -Dm644 packaging/icons/hicolor/192x192/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/192x192/jeff.png"
  install -Dm644 packaging/icons/hicolor/256x256/apps/jeff.png "$pkgdir/usr/share/icons/hicolor/256x256/jeff.png"
  install -Dm644 arts/icons/2000/icon.png "$pkgdir/usr/share/pixmaps/jeff.png"
  install -Dm644 arts/jeff.desktop "$pkgdir/usr/share/applications/jeff.desktop"
  install -Dm755 jeff-desktop/target/jeff-qt "$pkgdir/usr/bin/jeff"
}
