# Maintainer: Mark CDA <aclo.create@gmail.com>

pkgname=jeff-qt

_tag=39a297350ad1cb69b48e4b76200ff1d99cdfe998
source=(git+https://github.com/markcda/jeff.git?signed#tag=$_tag)

pkgver=2.1.1.1.r1.g39a2973
pkgrel=1
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
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/applications"
  mkdir "$pkgdir/usr/share/pixmaps"
  cp arts/icons/2000/icon.png "$pkgdir/usr/share/pixmaps/jeff.png"
  cp arts/jeff.desktop "$pkgdir/usr/share/applications/jeff.desktop"
  cp jeff-qt/target/jeff-qt "$pkgdir/usr/bin/jeff"
}
