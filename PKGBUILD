# Maintainer: Mark CDA <aclo.create@gmail.com>

pkgname=jeff

_tag=f19bd19935459c3a092f4bd0cc14cb0c906837d6
source=(git+https://github.com/markcda/jeff.git#tag=$_tag)

pkgver=2.2.3.r0.gf19bd19
pkgrel=2
pkgdesc="Extensible chatbot and automation tool"
arch=("x86_64")
url="https://github.com/markcda/jeff"
license=('MIT')
depends=('python' 'qt5-base')
makedepends=('git' 'base-devel' 'cmake' 'qt5-tools')
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
