# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

_gitname=ktp-auth-handler
pkgname=telepathy-kde-auth-handler-git
pkgver=v15.08.1.r1.g6c9babe
pkgrel=1
pkgdesc='Provide UI/KWallet Integration For Passwords and SSL Errors on Account Connect'
arch=('i686' 'x86_64')
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('qca-qt5' 'telepathy-kde-common-internals-git')
makedepends=('extra-cmake-modules' 'git')
conflicts=('telepathy-kde-auth-handler')
source=("git://anongit.kde.org/$_gitname")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
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
