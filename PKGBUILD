# Maintainer: Mark CDA <aclo.create@gmail.com>

pkgname=jeff

_tag=aeca6020684918f2c7055c0cb62b84e6c82b64fa
source=(git+https://github.com/markcda/jeff.git#tag=$_tag)

pkgver=2.2.0.r0.gaeca602
pkgrel=3
pkgdesc="Extensible chatbot and automation tool"
arch=("x86_64")
url="https://github.com/markcda/jeff"
license=('MIT')
depends=('python' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools')
options=('strip')
sha256sums=('SKIP')

build() {
  cd jeff
  git submodule init
  git submodule update
  cd jeff-qt
  mkdir target
  cmake -S . -B ./target
  lrelease l10n/jeff_ru.ts -qm l10n/jeff_ru.qm
  lrelease l10n/jeff_ua.ts -qm l10n/jeff_ua.qm
  cd target
  make jeff-qt
}

package() {
  cd jeff
  install -Dm644 arts/icons/2000/icon.png "$pkgdir/usr/share/pixmaps/jeff.png"
  install -Dm644 arts/jeff.desktop "$pkgdir/usr/share/applications/jeff.desktop"
  install -Dm755 jeff-qt/target/jeff-qt "$pkgdir/usr/bin/jeff"
}
