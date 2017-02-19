# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-qt-git
pkgver=r131.9af482c
pkgrel=1
pkgdesc='Tiny Qt Babe Music Player'
arch=('i686' 'x86_64')
url="https://github.com/milohr/babe-qt"
license=('GPL3')
depends=('hicolor-icon-theme' 'knotifications' 'ki18n' 'taglib')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git" 'Babe.desktop')
sha256sums=('SKIP' '35bba78ce6d8cc4d1e9b20ed604bf55e38d9227a1435fbc2d69dff9dc4871053')
 
pkgver() {
  cd babe-qt
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe-qt
  qmake-qt5
  make
}
 
package() {
  cd babe-qt
  install -Dm755 Babe "$pkgdir/usr/bin/Babe"
  install -Dm755 data/babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/Babe.svg"
  install -Dm644 ../Babe.desktop "$pkgdir/usr/share/applications/Babe.desktop"
}
