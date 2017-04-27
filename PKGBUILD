# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=r37.g9af8ab2
pkgrel=1
pkgdesc='Tiny Qt Babe Music Player'
arch=('i686' 'x86_64')
url="https://babe.kde.org/"
license=('GPL3')
depends=('hicolor-icon-theme' 'knotifications' 'ki18n' 'taglib')
makedepends=('extra-cmake-modules' 'git' 'python')
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git' 'cmake.patch')
sha256sums=('SKIP' '6cd25406e607d248ff00baf1b204a32ca0eca59d53465b1904795abf917b4cb9')

pkgver() {
  cd babe
  printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd babe
  patch -p1 < $srcdir/cmake.patch
}

build() {
  cd babe
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  make -C babe DESTDIR="${pkgdir}/" install
}
