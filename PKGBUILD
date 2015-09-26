# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv
pkgver="1.1"
pkgrel=1
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2' 'speex')
#depends=('glibc' 'portaudio' 'hamlib' 'wxgtk' 'codec2' 'speex')
makedepends=('cmake')
source=("https://files.freedv.org/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('bd149f74ceae9c63b23c37d2e6d876238b9c1759d8bd1213675d3d0d2f817863e952129306ca37da9f41297b17a9f74d57cb807689ef051b3d94a8f8b52b5727')


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
