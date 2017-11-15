# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=opencollada
pkgver=1.6.59
pkgrel=1
epoch=1
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(x86_64)
url="https://github.com/KhronosGroup/OpenCOLLADA"
license=('GPL')
depends=('libxml2' 'pcre')
makedepends=('git' 'cmake')
source=('opencollada.conf'
        "git://github.com/KhronosGroup/OpenCOLLADA.git#tag=v${pkgver}")
md5sums=('5f7e9d79ab86756648b648ee5ed6ce1d'
         'SKIP')

build() {
  cd "$srcdir"/OpenCOLLADA

  [[ -d build ]] && rm -r build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SHARED=ON \
    -DUSE_STATIC=OFF
  make
}

package() {
  cd "$srcdir"/OpenCOLLADA/build

  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/opencollada.conf $pkgdir/etc/ld.so.conf.d/opencollada.conf
}

# vim:set ts=2 sw=2 et:
