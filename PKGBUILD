# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>

pkgname=freedv
pkgver="1.2.2"
pkgrel=2
pkgdesc="Digital Voice for Radio Amateurs"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freedv.org/"
depends=('glibc' 'portaudio' 'hamlib' 'sox' 'wxgtk' 'codec2' 'speex' 'libao')
#depends=('glibc' 'portaudio' 'hamlib' 'wxgtk' 'codec2' 'speex')
makedepends=('cmake')
source=("https://freedv.com/wp-content/uploads/sites/8/2017/10/$pkgname-$pkgver.tar.xz")
sha512sums=('63ad0fd7a3fc0f88784b934738a51a2a6a0e58ae15aa4599c0efa36d3119f0c9c5778a1becaa8daa7161a8da3dc4c9247a813fea6a4c7de6d3cb22f5df437737')


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
