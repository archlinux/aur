# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=qtxlsxwriter-git
pkgver=0.3.0.r330.6895d8b
pkgrel=1
pkgdesc=".xlsx file reader and writer for Qt5"
url="https://github.com/VSRonin/QtXlsxWriter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base>=5.5.0')
makedepends=('git' 'cmake>=3.2.0')
conflicts=('qtxlsxwriter')
provides=('qtxlsxwriter')
source=("git://github.com/VSRonin/QtXlsxWriter.git")
sha512sums=('SKIP')

pkgver() {
  cd QtXlsxWriter
  echo "0.3.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../QtXlsxWriter \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
