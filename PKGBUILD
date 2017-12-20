# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=1.0.r272.g4a1cc5d
pkgrel=1
pkgdesc='Tiny Qt Music Player to keep your favorite songs at hand'
arch=('i686' 'x86_64')
url="https://babe.kde.org/"
license=('GPL3')
depends=('desktop-file-utils' 'gtk-update-icon-cache' 'ki18n' 'knotifications' 'qt5-webengine' 'qt5-websockets' 'taglib')
makedepends=('git')
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git')
sha256sums=('SKIP')

pkgver() {
  cd babe
  version="$(grep 'Version:' src/dialogs/about.cpp | awk '{print $5 "." $6}' | awk -F'\' '{print $1}')"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe
  qmake-qt5
  make
}
 
package() {
  cd babe
  install -Dm755 babe "$pkgdir/usr/bin/babe"
  install -Dm644 data/48-apps-babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/babe.svg"
  install -Dm644 data/128-apps-babe.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/babe.png"
  install -Dm655 org.kde.babe.appdata.xml "$pkgdir/usr/share/metainfo/org.kde.babe.appdata.xml"
  install -Dm755 org.kde.babe.desktop "$pkgdir/usr/share/applications/org.kde.babe.desktop"
}
