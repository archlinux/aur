# Maintainer: ObserverOfTime <chronobserver@disroot.org>
# Based on kde-thumbnailer-apk

pkgname=kde-thumbnailer-apk-libarchive
pkgver=1.1+libarchive
pkgrel=1
pkgdesc="Preview image generator plugin for \
Android Application Package files (libarchive branch)"
arch=('i686' 'x86_64')
url="https://github.com/z3ntu/kde-thumbnailer-apk"
license=('GPL')
depends=('kio' 'libarchive')
conflicts=('kde-thumbnailer-apk')
provides=('kde-thumbnailer-apk=1.1')
makedepends=('cmake' 'extra-cmake-modules' 'libarchive')
source=("$pkgname.tar.gz::https://github.com/z3ntu/kde-thumbnailer-apk/archive/libarchive.tar.gz")
sha256sums=('ca43a2dc7731ba3791b578da925d8ea9cd32ebdde5950c65b7dabc4072cfbfa7')

prepare() {
  sed -i $pkgname/apkcreator.cpp -e \
    '/#include <archive_entry.h>/a #include <optional>'
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -B $pkgname/build -Wno-dev $pkgname
  cmake --build $pkgname/build
}

package() {
  DESTDIR="$pkgdir" cmake \
    --build $pkgname/build --target install
}
