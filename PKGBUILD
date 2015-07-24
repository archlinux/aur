# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kipi-plugins-frameworks-git
pkgver=5.0.0.r10621.4d1859f
pkgrel=1
pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam, Gwenview, and KPhotoalbum. KF5 Frameworks branch. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.digikam.org/sharedlibs'
license=('GPL' 'LGPL' 'FDL')
depends=('libkdcraw-frameworks-git' 'libkexiv2-frameworks-git' 'libkipi-frameworks-git' 'threadweaver')
optdepends=('libksane-frameworks-git: Image Acquire plugin'
            'libkvkontakte-frameworks-git: VKontakte.ru Exporter plugin'
            'libmediawiki-frameworks-git: MediaWiki plugin'
            'libkgeomap-frameworks-git: Geolocator plugin'
            'kcalcore-git: Calendar plugin'
            'kwallet: Password management'
            'hugin: Panaorama plugin')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'python' 'kwallet'
             'libkvkontakte-frameworks-git' 'libmediawiki-frameworks-git' 'libksane-frameworks-git'
             'libkgeomap-frameworks-git' 'kcalcore-git')
conflicts=('kipi-plugins')
source=('git://anongit.kde.org/kipi-plugins#branch=frameworks')
sha1sums=('SKIP')
install=kipi-plugins-frameworks-git.install

pkgver() {
  cd kipi-plugins
  _ver="$(cat CMakeLists.txt | grep -m3 -e _MAJOR_VERSION -e _MINOR_VERSION -e _PATCH_VERSION | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

build() {
  cd build
  cmake ../kipi-plugins \
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
