# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-qt-git
pkgver=r129.1377e59
pkgrel=1
pkgdesc='Tiny Qt Babe Music Player'
arch=('i686' 'x86_64')
url="https://github.com/milohr/babe-qt"
license=('GPL3')
depends=('hicolor-icon-theme' 'knotifications' 'ki18n' 'taglib')
makedepends=('extra-cmake-modules' 'git' 'python')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git" 'babe.desktop')
sha256sums=('SKIP' '972e7d5c907a974ad2c444caaffacbed096bf7bd8d7d810b663ca33c6e16beea')
 
pkgver() {
  cd babe-qt
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe-qt
  cmake .
  make
}
 
package() {
  cd babe-qt
  install -Dm755 babe "$pkgdir/usr/bin/babe"
  install -Dm755 data/babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/babe.svg"
  install -Dm644 ../babe.desktop "$pkgdir/usr/share/applications/babe.desktop"
}
