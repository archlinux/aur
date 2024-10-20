# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=stopmotion-git
pkgver=0.8.7.r7.g026babc
pkgrel=1
arch=(x86_64)
pkgdesc="Stop motion animation creation program"
url="https://invent.kde.org/multimedia/stopmotion"
license=(GPL-2.0-or-later)
depends=(qt5-base qt5-multimedia libarchive libxml2 glibc gcc-libs libvorbis)
makedepends=(git cmake qt5-tools)
provides=(stopmotion)
conflicts=(stopmotion)
source=("git+https://invent.kde.org/multimedia/stopmotion.git")
sha256sums=('SKIP')

pkgver() {
  cd stopmotion
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "stopmotion" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
