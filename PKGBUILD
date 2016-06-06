# Maintainer: orumin <dev@orum.in>

_basename=chromaprint
pkgname="lib32-$_basename"
pkgver=1.3.1
pkgrel=1
pkgdesc='Library that implements a custom algorithm for extracting fingerprints from any audio source (32-bit)'
url='https://acoustid.org/chromaprint'
arch=('x86_64')
license=('LGPL')
depends=('lib32-ffmpeg')
makedepends=('cmake')
source=("https://bitbucket.org/acoustid/${_basename}/downloads/${_basename}-${pkgver}.tar.gz")
sha1sums=('439c5d34a3ff46bcdb54cbcb613da175eb4d83c5')

prepare() {
  mkdir build
}

build() {
  cd build

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake ../$_basename-$pkgver \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_EXAMPLES=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  cd "$pkgdir"/usr
  rm -r bin include
  mv lib lib32
}
