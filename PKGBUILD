# Maintainer Zanny <lordzanny@gmail.com>
# Maintainer: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Author: Antonio Rojas <arojas@archlinux.org>

pkgname=telepathy-kde-integration-module-git
_name=ktp-kded-module
pkgver=v20.04.0.r6.g0ceac18
pkgrel=1
pkgdesc='Sits in KDED and takes care of various bits of system integration like setting user to auto-away or handling connection errors'
arch=(x86_64)
url='http://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)
depends=(telepathy-kde-common-internals-git kidletime kactivities)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(telepathy-kde-integration-module)
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

