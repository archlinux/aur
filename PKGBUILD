# Maintainer: Elvis Angelaccio <elvis.angelaccio@kdemail.net>
# Contributor: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kwave
pkgver=0.9.1
pkgrel=1
pkgdesc="A sound editor for KDE."
arch=('i686' 'x86_64')
url='http://kwave.sourceforge.net'
license=('GPL')
depends=('qt5-multimedia'
         'kio'
         'audiofile'
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
optdepends=('libmad: MP3 plugin'
            'opus: OGG plugin')
conflicts=('kwave-git')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-1.tar.bz2")
sha256sums=('5698bc0c3970b50ad47de6c8f9f2fae3921b7403eec341d7117fa732a9f2fc1f')
install=kwave.install

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../"$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_MP3=ON
  make
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
