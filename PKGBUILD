# Maintainer: Maxime Gauduin <alucryd@gmail.com>

pkgname=lib32-orc
pkgver=0.4.23
pkgrel=1
pkgdesc='The Oild Runtime Compiler'
arch=('x86_64')
license=('custom')
url='http://code.entropywave.com/projects/orc/'
depends=('lib32-glibc' 'orc')
makedepends=('valgrind')
source=("http://gstreamer.freedesktop.org/data/src/orc/orc-${pkgver}.tar.xz")
sha256sums=('767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7')

build() {
  cd orc-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static \
    --enable-backend=mmx,sse,altivec
  make
}

package() {
  cd orc-${pkgver}

  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s orc "${pkgdir}"/usr/share/licenses/lib32-orc
}

# vim: ts=2 sw=2 et:
