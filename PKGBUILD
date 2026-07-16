# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-io-extras
pkgver=26.04.3
pkgrel=1
pkgdesc='Additional components to increase the functionality of sonic-frameworks-io'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-frameworks-io-extras'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         karchive
         kcmutils
         kconfig
         kdbusaddons
         kdnssd
         kdsoap-qt6
         kdsoap-ws-discovery-client
         ki18n
         knotifications
         kservice
         kwidgetsaddons
         libgcc
         libimobiledevice
         libkexiv2
         libmtp
         libplist
         libproxy
         libssh
         libstdc++
         libtirpc
         libxcursor
         qt6-base
         qt6-svg
         ripgrep-all
         sh
         smbclient
         solid
         sonic-activities
         sonic-frameworks-core-addons
         sonic-frameworks-io
         syntax-highlighting)
makedepends=(gperf
             libappimage
             openexr
             plasma-activities-stats
             qcoro
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools
             taglib)
optdepends=('kimageformats: thumbnails for additional image formats'
            'libappimage: AppImage thumbnails'
            'openexr: EXR format thumbnails'
            'perl: info kioslave'
            'plasma-activities-stats: recently used kioslave'
            'qt6-imageformats: thumbnails for additional image formats'
            'taglib: audio file thumbnails')
provides=(kio-extras)
conflicts=(kio-extras)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6c2b6b9383d0a40a7d004eb1a3d807fdb2c6ea8819518152d98a906d88e6cc88')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
