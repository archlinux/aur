# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-auth-handler-git
pkgver=r236.c666e95
pkgrel=1
pkgdesc='Provide UI/KWallet Integration For Passwords and SSL Errors on Account Connect'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('qca-qt5' 'telepathy-kde-common-internals-git')
makedepends=('extra-cmake-modules' 'git')
conflicts=('telepathy-kde-auth-handler')
replaces=('telepathy-kde-auth-handler-frameworks-git')
source=("git://anongit.kde.org/ktp-auth-handler.git")
sha256sums=('SKIP')

pkgver() {
  cd ktp-auth-handler
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../ktp-auth-handler \
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
