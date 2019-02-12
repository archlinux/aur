# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kscd-git
pkgver=v17.08.3.24.gaf73a1c
pkgrel=1
pkgdesc="KDE CD player. (GIT version)"
arch=('x86_64')
url='https://www.kde.org/applications/multimedia/kscd/'
license=('GPL2')
depends=('phonon-qt5'
         'solid'
         'kxmlgui'
         'libdiscid'
         'libmusicbrainz5'
         'hicolor-icon-theme'
         )
conflicts=('kdemultimedia-kscd'
           'kscd'
           )
provides=('kscd')
makedepends=('extra-cmake-modules'
             'git'
             'python'
             )
source=('git://anongit.kde.org/kscd.git#branch=kf5')
sha256sums=('SKIP')

pkgver() {
  cd kscd
#   _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '"' -f2 | paste -sd'.')"
#   echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kscd \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
