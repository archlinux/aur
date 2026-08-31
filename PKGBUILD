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
depends=(glibc
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
             qcoro
             sonic-activities-stats
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools
             taglib)
optdepends=('kimageformats: thumbnails for additional image formats'
            'libappimage: AppImage thumbnails'
            'openexr: EXR format thumbnails'
            'perl: info kioslave'
            'qt6-imageformats: thumbnails for additional image formats'
            'sonic-activities-stats: recently used kioslave'
            'taglib: audio file thumbnails')
provides=(kio-extras)
conflicts=(kio-extras)
groups=(sonicde-frameworks)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('349a20c5f0d3f96362dc41c0b2da94b2aca7796ceecea41d6b3829d4d5db2297')

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
