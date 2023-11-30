# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=digikam
_pkgver=8.2.0
pkgver=${_pkgver//-/} # for beta versions
pkgrel=1
pkgdesc='An advanced digital photo management application'
arch=(x86_64)
license=(GPL)
url='https://www.digikam.org/'
depends=(akonadi-contacts5
         exiv2
         expat
         ffmpeg
         gcc-libs
         glib2
         glibc
         imagemagick
         jasper
         kcalendarcore5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcontacts5
         kcoreaddons5
         kfilemetadata5
         ki18n5
         kiconthemes5
         kio5
         knotifications5
         knotifyconfig5
         kservice5
         kwidgetsaddons5
         kxmlgui5
         lcms2
         lensfun
         libass
         libglvnd
         libgphoto2
         libheif
         libjpeg-turbo
         libksane
         libpng
         libpulse
         libtiff
         libx11
         libxext
         libxml2
         libxslt
         libxv
         marble-common
         opencv
         perl
         perl-image-exiftool
         portaudio
         qt5-base
         qt5-networkauth
         qt5-webengine
         qt5-x11extras
         qt5-xmlpatterns
         sh
         solid5
         sonnet5
         threadweaver5
         x265
         zlib)
makedepends=(boost
             doxygen
             eigen
             extra-cmake-modules
             kdoctools5)
optdepends=('darktable: RAW import'
            'hugin: panorama tool'
            'qt5-imageformats: support for additional image formats (WEBP, TIFF)'
            'rawtherapee: RAW import')
source=(https://download.kde.org/stable/$pkgname/${_pkgver%-*}/digiKam-$_pkgver.tar.xz{,.sig}
        akonadi-contacts.patch)
sha256sums=('2f7fcb559b123ed9ecae5a5aef6f4560eee5f49206d9d1746dec9ab6c8fb38bf'
            'SKIP'
            '06d91ac72cf67ed0b125da8d8b1d3ab9e4edd848e322e5984069e1c26f02e01e')
validpgpkeys=(D1CF2444A7858C5F2FB095B74A77747BC2386E50) # digiKam.org (digiKam project) <digikamdeveloper@gmail.com>

prepare() {
  patch -d $pkgname-$_pkgver -p1 < akonadi-contacts.patch
}

build() {
  cmake -B build -S $pkgname-$_pkgver \
    -DBUILD_TESTING=OFF \
    -DENABLE_KFILEMETADATASUPPORT=ON \
    -DENABLE_MEDIAPLAYER=ON \
    -DENABLE_AKONADICONTACTSUPPORT=ON \
    -DENABLE_MYSQLSUPPORT=ON \
    -DENABLE_APPSTYLES=ON \
    -DENABLE_QWEBENGINE=ON \
    -DSSE4_1_FOUND=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
