# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv
pkgver="1.2"
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2' 'speex' 'libao')
#depends=('glibc' 'portaudio' 'hamlib' 'wxgtk' 'codec2' 'speex')
makedepends=('cmake')
source=("https://files.freedv.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('6f368ba3517ac57cdb581a21bf3a87f50b168bf3de51666b99f09469ed12e45a368740ee8a7f83adf6f6b59341ea7a14b3ba30a597f7ad96ba2091ecd9b89661')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p build_linux
  cd build_linux
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib -DUSE_STATIC_SOX=TRUE -DUSE_STATIC_SPEEXDSP=FALSE -DUSE_STATIC_CODEC2=FALSE -DBOOTSTRAP_WXWIDGETS=FALSE
  make 
}

package() {
  cd "$pkgname-$pkgver"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/freedv/COPYING"
  install -m644 -D README.txt "$pkgdir/usr/share/doc/freedv/README.txt"
  cd "build_linux"
  make DESTDIR="$pkgdir" install
}
