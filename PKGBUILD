# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=r16.gfc845fc
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
sha256sums=('SKIP' '246133348fe676df5411bda7b1df8dd801f377d2dc7c6f3344997b81d2eb9ae2')

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
