# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kipi-plugins-frameworks-git
pkgver=5.0.0.r10377.5ebbbe7
pkgrel=1
pkgdesc="A collection of plugins extending the KDE graphics and image applications as digiKam, Gwenview, and KPhotoalbum. KF5 Frameworks branch (GIT version)"
url='http://www.digikam.org/sharedlibs'
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL')
depends=('libkdcraw-frameworks-git' 'libkexiv2-frameworks-git' 'libkipi-frameworks-git' 'libkvkontakte-frameworks-git' 'threadweaver')
makedepends=('extra-cmake-modules' 'kdoctools' 'git' 'kparts')
conflicts=('kipi-plugins')
source=("git://anongit.kde.org/kipi-plugins#branch=frameworks")
sha1sums=('SKIP')
install="kipi-plugins-frameworks-git.install"

pkgver() {
  cd kipi-plugins
  _ver="$(cat CMakeLists.txt | grep -e KIPIPLUGINS_MAJOR_VERSION -e KIPIPLUGINS_MINOR_VERSION -e KIPIPLUGINS_PATCH_VERSION | head -n3 | cut -d '"' -f2)"
  echo "$(echo ${_ver} | tr ' ' .).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
  make -C build DESTDIR=${pkgdir} install
}
