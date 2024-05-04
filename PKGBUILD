# Maintainer:Antonio Rojas <arojas@archlinux.org>

_name=purpose
pkgname=${_name}5
pkgver=5.116.0
pkgrel=1
pkgdesc='Framework for providing abstractions to get the developers purposes fulfilled'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(kio5
         kirigami2)
makedepends=(extra-cmake-modules intltool)
optdepends=('kdeconnect: sharing to smartphone via KDE Connect'
            'telegram-desktop: sharing via Telegram'
            'bluedevil: sharing via Bluetooth'
            'prison5: QR code plugin')
conflicts=("$_name<5.111")
replaces=("$_name<5.111")
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('62d66c1a32b614971a52d385be1ea5d218a95b9e65a0b547b7913238c38d1dbc'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $_name-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
