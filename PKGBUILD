# Maintainer: lsdaniel <lsdaniel zero one at gee mail dot com>

pkgname=kscreenlocker-systemd-homed
pkgver=5.22.3
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture (with systemd-homed patches)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(layer-shell-qt kidletime kwayland kdeclarative perl)
makedepends=(extra-cmake-modules kdoctools kcmutils libxcursor)
conflicts=(kscreenlocker)
provides=(kscreenlocker)
optdepends=('kcmutils: configuration module')
source=(https://download.kde.org/stable/plasma/$pkgver/kscreenlocker-$pkgver.tar.xz{,.sig}
         'dc68e219d6fb3efa943cfa0adf0e615fac42b3ec.patch')
sha256sums=('d71992dbd57a1c7f3051a5b98898d791e9ae2db128b63843332d9e68f75d3285'
            'SKIP'
            'ff78fa0e6c2b53303ea4ca295fa8d8c3b75b1f98657daab39f02920a1b6af643')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  patch kscreenlocker-$pkgver/greeter/authenticator.cpp dc68e219d6fb3efa943cfa0adf0e615fac42b3ec.patch
  cmake -B build -S kscreenlocker-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
