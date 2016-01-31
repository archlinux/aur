# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

_gitname=ktp-desktop-applets
pkgname=telepathy-kde-desktop-applets-git
pkgver=v15.12.0.r4.g7e44661
pkgrel=1
pkgdesc='The KDE-Telepathy Plasma desktop applets'
arch=(i386 x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=('GPL')
depends=('telepathy-kde-common-internals-git')
makedepends=('extra-cmake-modules' 'git')
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
