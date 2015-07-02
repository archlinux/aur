# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=opencollada
pkgver=20150702
_commit=3335ac164e68b2512a40914b14c74db260e6ff7d # Magic blender commit
pkgrel=2
pkgdesc="Stream based reader and writer library for COLLADA files"
arch=(i686 x86_64)
url="https://github.com/KhronosGroup/OpenCOLLADA"
license=('GPL')
depends=('libxml2' 'pcre')
makedepends=('git' 'cmake')
source=('opencollada.conf'
        "git://github.com/KhronosGroup/OpenCOLLADA.git#commit=$_commit")
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
