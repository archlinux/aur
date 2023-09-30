# Maintainer: Antonio Rojas <arojas@archlinux.org>

_name=kdav
pkgname=${_name}5
pkgver=5.110.0
pkgrel=2
epoch=1
pkgdesc='A DAV protocol implemention with KJobs'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio5)
makedepends=(extra-cmake-modules doxygen qt5-tools)
conflicts=("$_name<1:5.111")
replaces=("$_name<1:5.111")
provides=($_name=$pkgver)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('ca748facfcf92a993da5c01ebdb3b7db0096fb3cb071c2cf0f7387e8128ee563'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
