# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=0.5.Beta.r163.geba9061
pkgrel=1
pkgdesc='Tiny Qt Music Player to keep your favorite songs at hand'
arch=('i686' 'x86_64')
url="https://babe.kde.org/"
license=('GPL3')
depends=('hicolor-icon-theme' 'ki18n' 'knotifications' 'taglib')
makedepends=('extra-cmake-modules' 'git' 'python')
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git')
sha256sums=('SKIP')

pkgver() {
  cd babe
  version="$(grep 'Version:' about.cpp | awk '{print $5 "." $6}' | awk -F'\' '{print $1}')"
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd babe
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd babe
  make DESTDIR="${pkgdir}/" install
  install -Dm755 data/babe.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/babe.svg"
}
