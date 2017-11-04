# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=libxlsxwriter-git
pkgver=0.7.5.r528.18c8cb6
pkgrel=1
pkgdesc='A C library for creating Excel XLSX files'
arch=('i686' 'x86_64')
url='https://libxlsxwriter.github.io'
license=('BSD')
depends=('minizip')
makedepends=('git' 'cmake>=2.8.7')
conflicts=('libxlsxwriter')
provides=('libxlsxwriter')
source=('git://github.com/jmcnamara/libxlsxwriter.git')
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
    -DUSE_SYSTEM_MINIZIP=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR=${pkgdir} install
  install -Dm644 libxlsxwriter/License.txt ${pkgdir}/usr/share/licenses/libxlsxwriter-git/License.txt
}
