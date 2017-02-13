# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-qt-git
pkgver=r85.c57941b
pkgrel=1
pkgdesc='Tiny Qt Babe Music Player'
arch=('i686' 'x86_64')
url="https://github.com/milohr/babe-qt"
license=('GPL')
depends=('hicolor-icon-theme' 'knotifications' 'ki18n' 'taglib')
makedepends=('git')
source=("git+${url}.git" 'Babe.desktop')
sha256sums=('SKIP' '32c793f0acbd7c049258012b5d38cb6fbd5b597c5783c9a6ba3ecd06a6e3c27a')
 
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
  install -Dm755 data/babe_128.svg "$pkgdir/usr/share/pixmaps/Babe.svg"
  install -Dm755 data/babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/Babe.svg"
  install -Dm644 ../Babe.desktop "$pkgdir/usr/share/applications/Babe.desktop"
}
