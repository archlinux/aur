# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-accounts-kcm-git
pkgver=r1109.608947e
pkgrel=1
pkgdesc='KCM Module for configuring Telepathy Instant Messaging Accounts'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-qt5' 'kaccounts-integration-git')
makedepends=('extra-cmake-modules' 'git' 'intltool')
conflicts=('telepathy-kde-accounts-kcm')
replaces=('telepathy-kde-accounts-kcm-frameworks-git')
source=("git://anongit.kde.org/ktp-accounts-kcm.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-accounts-kcm
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-accounts-kcm \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
