# Maintainer: Evert Vorster <evorster@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: IncredibleLaser
# Contributor: nous <nous at archlinux.us>
# Contributor: pressh

pkgname=kdenlive-frameworks-git
pkgver=15.04.0.r5977.6d0f1ba
pkgrel=1
pkgdesc="A non-linear video editor for Linux using the MLT video framework. KF5 Frameworks (GIT Version, frameworks branch)"
arch=('i686' 'x86_64')
url="http://http://www.kdenlive.org/"
license=('GPL')
depends=('glu' 'knewstuff' 'kplotting' 'knotifyconfig' 'mlt' 'hicolor-icon-theme')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'v4l-utils')
optdepends=('ffmpeg: for FFmpeg plugin'
            'cdrkit: for creation of DVD ISO images'
            'dvdauthor: for creation of DVD'
            'dvgrab: for firewire capture'
            'libdv: for webcam capture (if FFmpeg is not installed)'
            'recordmydesktop: for screen capture'
            'xine-ui: for DVD preview')
provides=('kdenlive')
conflicts=('kdenlive')
source=('git://anongit.kde.org/kdenlive#branch=frameworks') 
sha1sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd kdenlive
  _ver="$(cat CMakeLists.txt | grep KDENLIVE_VERSION | head -n1 | cut -d ' ' -f2 | tr -d ')')"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

build() {
  cd build
  cmake ../kdenlive \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}

