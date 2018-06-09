# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv
pkgver="1.3"
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2' 'speex' 'libao')
#depends=('glibc' 'portaudio' 'hamlib' 'wxgtk' 'codec2' 'speex')
makedepends=('cmake')
source=("https://hobbes1069.fedorapeople.org/freetel/freedv/$pkgname-$pkgver.tar.xz")
sha512sums=('24583e3054928299c30bbff98d2a6affa8423aeb21858f1bc41e34063b4681803953e950fab5d28ce7fc946bb8c651a487788710c5d75f5310ac7b8d1c303a61')


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
