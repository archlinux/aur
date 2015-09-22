# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv
pkgver="1.0.1"
pkgrel=2
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
#depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2' 'speex')
depends=('glibc' 'portaudio' 'hamlib' 'wxgtk' 'codec2' 'speex')
makedepends=('cmake')
source=("https://files.freedv.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('6db5ad1a8d7674151c06ce23e5b86122d2316c29858dbf382423d114328ca8f3ca39a6f28a3b15b458414e7786c849519264af138d74a34ce65d74eaf7aabb0a')


build() {
  cd "$pkgname-$pkgver"
  mkdir -p build_linux
  cd build_linux
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR:PATH=lib -DUSE_STATIC_SOX=TRUE -DUSE_STATIC_SPEEXDSP=FALSE -DUSE_STATIC_CODEC2=FALSE
  make 
}

package() {
  cd "$pkgname-$pkgver"
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/freedv/COPYING"
  install -m644 -D README.txt "$pkgdir/usr/share/doc/freedv/README.txt"
  cd "build_linux"
  make DESTDIR="$pkgdir" install
}
