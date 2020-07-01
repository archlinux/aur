# Maintainer: Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-common-internals-git
_name=ktp-common-internals
pkgver=v19.11.80.r54.g9f372a1
pkgrel=1
pkgdesc='Common components for KDE-Telepathy'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(knotifyconfig ktexteditor kpeople telepathy-logger-qt kaccounts-integration libotr telepathy-accounts-signon)
makedepends=(extra-cmake-modules git kdoctools doxygen python)
conflicts=(telepathy-kde-common-internals)
source=("git+https://invent.kde.org/network/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_name
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
