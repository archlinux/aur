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
         )
makedepends=('git'
             'cmake'
             'extra-cmake-modules'
             'kdoctools'
             'doxygen'
             'python'
             'librsvg'
             'opus'
             'fftw'
             'id3lib'
             'libmad'
             )
optdepends=('libmad: MP3 plugin'
            'id3lib: MP3 ID3 tag plugin'
            'opus: OGG plugin'
            'fftw: Sonagram plugin')
conflicts=('kwave-git')
source=('http://downloads.sourceforge.net/project/kwave/kwave/$pkgver/kwave-0.9.1-1.tar.bz2')
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
