# Maintainer:

pkgname=kwave-frameworks-git
pkgver=0.9.0.r3201.bf08602
pkgrel=1
pkgdesc="A sound editor for KDE. KF5 Frameworks. (GIT version)"
arch=('i686' 'x86_64')
url='http://kwave.sourceforge.net'
license=('GPL')
depends=('kio'
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
             'flac'
             'opus'
             'fftw'
             'libvorbis'
             'id3lib'
             'libmad'
             )
optdepends=('libmad: MP3 plugin'
            'id3lib: MP3 ID3 tag plugin'
            'opus: OGG plugin'
            'fftw: Sonagram plugin')
conflicts=('kwave')
provides=('kwave')
source=('git://anongit.kde.org/kwave.git#branch=frameworks')
sha1sums=('SKIP')
install=kwave-frameworks-git.install

pkgver() {
  cd kwave
  _ver="$(cat 'VERSION')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../kwave \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_MP3=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
