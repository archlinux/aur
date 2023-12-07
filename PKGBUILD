# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=${_pkgname}-slim-git
pkgver=8.2.0.r171.83865d7df8
pkgrel=1
pkgdesc='Digikam Qt6 build without mysql/akonadi/kcalendar/ksane/marble/panorama'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(exiv2
         expat
         ffmpeg
         gcc-libs
         glib2
         glibc
         imagemagick
         jasper
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kfilemetadata
         ki18n
         kiconthemes
         kio
         knotifications
         knotifyconfig
         kservice
         kwidgetsaddons
         kxmlgui
         lcms2
         lensfun
         libass
         libglvnd
         libgphoto2
         libheif
         libjpeg-turbo
         libpng
         libpulse
         libtiff
         libx11
         libxext
         libxml2
         libxslt
         libxv
         opencv
         perl
         perl-image-exiftool
         portaudio
         qt6-base
         qt6-networkauth
         qt6-webengine
         qt6-scxml
         sh
         solid
         sonnet
         x265
         zlib)
conflicts=(digikam digikam-git)
makedepends=(git
             boost
             doxygen
             eigen
             extra-cmake-modules
             kdoctools)
optdepends=('darktable: RAW import'
            'qt6-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import')
source=(git+https://invent.kde.org/graphics/$_pkgname.git)
sha256sums=('SKIP')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF \
    -DBUILD_WITH_QT6=1 \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=OFF \
    -DHAVE_KCALENDAR=0 \
    -DHAVE_KSANE=0 \
    -DHAVE_MARBLE=0 \
    -DHAVE_PANORAMA=0 \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DSSE4_1_FOUND=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
