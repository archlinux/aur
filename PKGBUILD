# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-desktop-applets-git
pkgver=r913.17ee2a6
pkgrel=1
pkgdesc='The KDE-Telepathy Plasma desktop applets'
arch=('any')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-git' 'telepathy-kde-accounts-kcm-git' 'plasma-workspace')
makedepends=('extra-cmake-modules' 'git')
replaces=('telepathy-kde-desktop-applets-frameworks-git')
source=("git://anongit.kde.org/ktp-desktop-applets.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-desktop-applets
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-desktop-applets \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
