# Maintainer: Elvis Angelaccio <elvis.angelaccio@kdemail.net>
# Contributor: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave
pkgver=0.9.2
pkgrel=1
pkgdesc="A sound editor for KDE."
arch=('i686' 'x86_64')
url='http://kwave.sourceforge.net'
license=('GPL')
depends=('qt5-multimedia'
         'kio'
         'audiofile'
         'libmad'
         'libsamplerate'
         'hicolor-icon-theme'
         'id3lib'
         'fftw')
makedepends=('cmake'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             'librsvg')
optdepends=('opus: OGG plugin')
conflicts=('kwave-git')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1.tar.bz2")
sha256sums=('e5a01ded2c6d783dd882024b21ba0ba625b84ea8349dceb400d2314683019657')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../"$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_MP3=ON
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
