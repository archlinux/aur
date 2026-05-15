# Maintainer: artist for Sonic-DE

pkgname=sonic-sysguard-library
pkgver=6.6.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Library for Sonic-DE to retrieve information on the current status of computer hardware'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-sysguard-library'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kauth
         kconfig
         kcoreaddons
         kdeclarative
         ki18n
         kirigami
         kitemmodels
         knewstuff
         kpackage
         kquickcharts
         kservice
         libdrm
         libnl
         libpcap
         lm_sensors
         qt6-5compat
         qt6-base
         qt6-declarative
         solid)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(sonicde)
conflicts=(libksysguard)
provides=(libksysguard)
replaces=(libksysguard)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  setcap CAP_NET_RAW=+ep "$pkgdir"/usr/lib/ksysguard/ksgrd_network_helper
}

sha256sums=('7ee001cc0d534fc9ab5f1ef8f1751107fe3af4503b6e914eaa5cbb174e360916')
