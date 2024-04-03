# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Askhat Bakarov <sirocco{at}ngs{dot}ru>

pkgname=android-file-transfer-git
pkgver=4.2.r49.ga9495bf
pkgrel=2
pkgdesc="An interactive MTP client implemented in C++ using Qt toolkit"
arch=(x86_64 i686)
url="https://github.com/whoozle/android-file-transfer-linux"
license=(LGPL2.1)
depends=(qt5-base fuse2 hicolor-icon-theme taglib)
makedepends=(cmake git qt5-tools ninja)
provides=(android-file-transfer)
conflicts=(android-file-transfer android-file-transfer-linux-git)
replaces=(android-file-transfer-linux-git)
source=("git+https://github.com/whoozle/android-file-transfer-linux.git")
sha256sums=('SKIP')

pkgver() {
  cd "android-file-transfer-linux"
  git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "android-file-transfer-linux" -Wno-dev \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \

  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
