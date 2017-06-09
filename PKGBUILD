# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname=libphash
_pkgname=pHash
pkgver=0.9.6
pkgrel=2
pkgdesc="Perceptual hashing library"
arch=(i686 x86_64)
url="http://phash.org/"
license=('GPL3')
depends=('mpg123' 'cimg' 'ffmpeg')
source=("$_pkgname-$pkgver.tar.gz::http://phash.org/releases/$_pkgname-$pkgver.tar.gz")
sha256sums=('3c8258a014f9c2491fb1153010984606805638a45d00498864968a9a30102935')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  #Video support is broken due to ffmpeg being too old and pHash doesn't link pthread directly
  LIBS="-lpthread" ./configure --enable-video-hash=no --prefix=/usr
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
