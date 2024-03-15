# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: Ronald van Haren <ronald@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=digikam
pkgname=digikam-without-akonadi
_pkgver=8.3.0
pkgver=${_pkgver//-/} # for beta versions
pkgrel=1
pkgdesc='An advanced digital photo management application - without akonadi & mariadb'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://www.digikam.org/'
depends=(exiv2
         expat
         ffmpeg
         gcc-libs
         glib2
         glibc
         imagemagick
         jasper
         kcalendarcore
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
         libglvnd
         libgphoto2
         libheif
         libjpeg-turbo
         libksane
         libpng
         libtiff
         libx11
         libxml2
         libxslt
         opencv
         perl
         perl-image-exiftool
         qt6-base
         qt6-multimedia
         qt6-networkauth
         qt6-scxml
         qt6-svg
         qt6-webengine
         sh
         solid
         sonnet
         threadweaver
         x265
         zlib)
makedepends=(boost
             doxygen
             eigen
             extra-cmake-modules
             kdoctools)
conflicts=('digikam')
replaces=('digikam-without-akonadi-mediawiki-vkontakte')
provides=('digikam')
optdepends=('darktable: RAW import'
            'hugin: panorama tool'
            'qt6-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import')
source=(https://download.kde.org/stable/$_pkgname/${_pkgver%-*}/digiKam-$_pkgver.tar.xz{,.sig})
sha256sums=('74107a2bff8375cddef78da05662af4fa9517acabfa0cf53692a2a338a8bf173'
            'SKIP')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

build() {
  cmake -B build -S $_pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_WITH_QT6=ON \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=OFF \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

