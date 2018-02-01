# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
 
pkgname=babe-git
pkgver=1.2.1.r3.gcc3a112
pkgrel=1
pkgdesc='Tiny Qt Music Player to keep your favorite songs at hand'
arch=(x86_64)
url='https://babe.kde.org/'
license=(GPL3)
depends=(ki18n knotifications qt5-webengine qt5-websockets taglib)
makedepends=(extra-cmake-modules git python)
optdepends=('youtube-dl: youtube support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" 'babe-qt')
replaces=('babe-qt')
source=('git+git://anongit.kde.org/babe.git')
sha256sums=('SKIP')

pkgver() {
  cd babe
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../babe \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}
 
package() {
  cd build
  make DESTDIR="$pkgdir" install
}
