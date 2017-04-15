# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=r8.8283c99
pkgrel=1
pkgdesc='Tiny Qt Babe Music Player'
arch=('i686' 'x86_64')
url="https://milohr.github.io/BabeIt/"
license=('GPL3')
depends=('hicolor-icon-theme' 'knotifications' 'ki18n' 'taglib')
makedepends=('extra-cmake-modules' 'git' 'python')
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git')
sha256sums=('SKIP')
 
pkgver() {
  cd babe
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd babe
  make DESTDIR="${pkgdir}/" install
  install -Dm644 data/babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/babe.svg"
  install -Dm755 org.kde.babe.desktop "$pkgdir/usr/share/applications/org.kde.babe.desktop"
  sed -i 's|Exec=Babe|Exec=babe|' "${pkgdir}/usr/share/applications/org.kde.babe.desktop"
  sed -i 's|Icon=Babe|Icon=babe|' "${pkgdir}/usr/share/applications/org.kde.babe.desktop"
}
