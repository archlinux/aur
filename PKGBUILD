# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Maarten Baert

pkgname=lib32-simplescreenrecorder
pkgver=0.4.4
pkgrel=1
pkgdesc="Record 32-bit OpenGL applications with SimpleScreenRecorder."
arch=("x86_64")
url="https://www.maartenbaert.be/simplescreenrecorder/"
license=("GPL3")
depends=("lib32-libgl" "lib32-glu" "lib32-libx11" "lib32-libxext" "lib32-libxfixes")
makedepends=("git" "cmake")
install=lib32-simplescreenrecorder.install
source=("git+https://github.com/MaartenBaert/ssr.git#tag=$pkgver")
md5sums=("SKIP")

prepare() {
  cd ssr
  mkdir -p build
}

build() {
  cd ssr/build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  #./configure --prefix=/usr --libdir=/usr/lib32 --disable-ssrprogram --disable-assert
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR='lib32' -DWITH_SIMPLESCREENRECORDER=OFF \
    -DENABLE_32BIT_GLINJECT=TRUE ../
  make
}

package() {
  cd ssr/build
  make DESTDIR="${pkgdir}" install
}
