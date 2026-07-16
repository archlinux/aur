# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-screenlocker
pkgver=6.7.3
pkgrel=1
pkgdesc='Library and components for secure lock screen architecture'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-screenlocker'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kconfig
         kcrash
         kdeclarative
         ki18n
         kidletime
         knotifications
         kpackage
         ksvg
         kxmlgui
         libx11
         libxcb
         libxi
         pam
         qt6-base
         qt6-declarative
         sonic-frameworks-core-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-screen-library
         xcb-util-keysyms)
makedepends=(kcmutils
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
optdepends=('kcmutils: configuration module')
provides=(kscreenlocker)
conflicts=(kscreenlocker)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        kde.pam
        kde-fingerprint.pam
        kde-smartcard.pam)
sha256sums=('8579de7e9e8a54462fd816259a505291ce69786a58736ad9a217c1d61f659b32'
            'adba7bb7c27eb3a572e5e9d3cea0dbeebe59d3634472d1863d14fe892cb13b2b'
            '32734b4e1ec8b7f7e32b6cb2d68285c5c4f15f53736bba085096e76095181241'
            '5d9c31cbf66e8e455b9559c929f184efd598f714743d5a1e6ce20adb44dc4b2d')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/kde.pam "$pkgdir"/usr/lib/pam.d/kde
  install -Dm644 "$srcdir"/kde-fingerprint.pam "$pkgdir"/usr/lib/pam.d/kde-fingerprint
  install -Dm644 "$srcdir"/kde-smartcard.pam "$pkgdir"/usr/lib/pam.d/kde-smartcard
}
