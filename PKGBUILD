# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=libdvdcss-git
pkgver=1.4.3.3.gd0b6a29
pkgrel=1
pkgdesc='A portable abstraction library for DVD decryption. (GIT version)'
arch=('x86_64')
license=('GPL2')
url='https://www.videolan.org/libdvdcss'
depends=('glibc')
makedepends=('git')
provides=('libdvdcss'
          'libdvdcss.so'
          )
conflicts=('libdvdcss')
source=('git+https://code.videolan.org/videolan//libdvdcss.git')
sha256sums=('SKIP')

pkgver() {
  cd libdvdcss
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd libdvdcss
  autoreconf -vif

  cd "${srcdir}/build"
  ../libdvdcss/configure \
    --prefix=/usr

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
