# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=libxlsxwriter-git
pkgver=0.7.2.r490.cc960e7
pkgrel=1
pkgdesc="A C library for creating Excel XLSX files"
arch=('i686' 'x86_64')
url="https://libxlsxwriter.github.io"
license=('BSD')
makedepends=('git' 'cmake>=2.8.0')
conflicts=('libxlsxwriter')
provides=('libxlsxwriter')
source=("git://github.com/jmcnamara/libxlsxwriter.git")
sha512sums=('SKIP')

pkgver() {
  cd libxlsxwriter
  echo "$(grep LXW_VERSION include/xlsxwriter.h | cut -d '"' -f2).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libxlsxwriter \
    -DBUILD_STATIC=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 libxlsxwriter/LICENSE.txt ${pkgdir}/usr/share/licenses/libxlsxwriter-git/LICENSE.txt
}
