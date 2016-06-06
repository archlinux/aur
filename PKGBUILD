# Maintainer: orumin <dev@orum.in>

_basename=sbc
pkgname="lib32-$_basename"
pkgver=1.3
pkgrel=1
pkgdesc="Bluetooth Subband Codec (SBC) library (32-bit)"
arch=('i686' 'x86_64')
url="http://www.bluez.org/"
license=('GPL' 'LGPL')
depends=('lib32-glibc' 'sbc')
source=(http://www.kernel.org/pub/linux/bluetooth/$_basename-$pkgver.tar.xz)
md5sums=('2d8b7841f2c11ab287718d562f2b981c')

build() {
  cd $_basename-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --disable-static --disable-tester \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr
  rm -r bin include
}
