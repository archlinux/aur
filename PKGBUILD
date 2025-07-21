# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kio5-extras
pkgver=24.02.2
pkgrel=4
pkgdesc='Additional components to increase the functionality of KIO'
arch=(x86_64)
url='https://www.kde.org/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         karchive5
         kconfig5
         kcoreaddons5
         kdbusaddons5
         kdnssd5
         kdsoap-qt5
         ki18n5
         kio5
         libimobiledevice
         libkexiv2-qt5
         libmtp
         libplist
         libssh
         libtirpc
         libxcursor
         qt5-base
         qt5-svg
         smbclient
         solid5
         syntax-highlighting5)
makedepends=(extra-cmake-modules
             gperf
             kdoctools5
             libappimage
             openexr
             taglib)
optdepends=('icoutils: Windows executable thumbnails'
            'kimageformats5: thumbnails for additional image formats'
            'libappimage: AppImage thumbnails'
            'openexr: EXR format thumbnails'
            'perl: info kioslave'
            'qt5-imageformats: thumbnails for additional image formats'
            'taglib: audio file thumbnails')
source=(https://download.kde.org/stable/release-service/$pkgver/src/kio-extras-kf5-$pkgver.tar.xz{,.sig})
sha256sums=('a9aaf58f3b802c8341bba1ceb95054f915059ea447f59ffc7b933cca71b12ac9'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S kio-extras-kf5-$pkgver \
    -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_ACTIVITIES=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
